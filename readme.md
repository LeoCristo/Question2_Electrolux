# Question 2 - Button State Machine on EFR32MG24

## Solution Overview

This project implements the required button firmware in C for a Silicon Labs EFR32MG24 board.

The firmware:

- detects whether the button is pressed (`ON`) or released (`OFF`);
- measures how long the button remains pressed;
- changes to the `PROTECTED` state when the button is released;
- remains in `PROTECTED` for 10 seconds before returning to `OFF`;
- uses a non-blocking software debounce filter;
- uses the Silicon Labs Sleep Timer to measure elapsed time.

The following hardware resources are used:

- the push button available on the development board, connected to `PB2`;
- an external LED connected to `PD2`;
- the VCOM/EUSART interface for debug messages.

The button is configured as an input with a pull-up resistor. Therefore:

The LED uses active-low logic:

- `0` turns the LED on;
### Board Image

Insert an image of the board here and identify the EFR32 microcontroller, the button, the LED, and the pins used by the firmware.

## State Machine

The firmware is organized as a finite state machine with three states:

- `BUTTON_STATE_OFF`: the LED is off and the system waits for a button press;
- `BUTTON_STATE_ON`: the button is pressed and the LED is on;
- `BUTTON_STATE_PROTECTED`: the button has been released and the system remains protected for 10 seconds.

The state transitions are:

	v
BUTTON_STATE_ON
	| button released
	v
BUTTON_STATE_PROTECTED
	| 10 seconds elapsed
	v
BUTTON_STATE_OFF
```

### State Behavior

In `BUTTON_STATE_OFF`, the LED is turned off. After a valid debounced button press, the firmware stores the press timestamp, turns the LED on, and changes to `BUTTON_STATE_ON`.

In `BUTTON_STATE_ON`, the LED remains on. The press duration is calculated as the difference between the current time and the stored press timestamp. When the button is released, the firmware stores the release timestamp and changes to `BUTTON_STATE_PROTECTED`.

In `BUTTON_STATE_PROTECTED`, the LED remains on for 10 seconds. After the timeout expires, the firmware changes back to `BUTTON_STATE_OFF` and turns the LED off.

### State Machine Image

Insert the state-machine diagram here.

Suggested file: `docs/images/button-fsm.png`.

## Button Debouncing

Mechanical buttons can produce short electrical oscillations when pressed or released. Without filtering, one physical action could be detected as several button events.

The project uses a non-blocking software debounce filter. When the raw button signal changes, the filter starts a timestamp. The new state is accepted only after the signal remains stable for `50 ms`.

The main loop continues running during this period; no blocking `delay()` function is used.

## Time Measurement

The project uses the Silicon Labs **Sleep Timer**:

```c
sl_sleeptimer_init();
```

The current timer value is read in ticks and converted to milliseconds:

```c
sl_sleeptimer_tick_to_ms(sl_sleeptimer_get_tick_count());
```

The elapsed time is used to:

- validate the 50 ms debounce interval;
- measure how long the button remains pressed;
- control the 10-second `PROTECTED` interval.

The time comparisons use unsigned subtraction, for example:


This approach keeps the main loop responsive and avoids blocking the processor while waiting for a timeout.

## Software Structure

The software is divided into hardware configuration, application control, and state-machine logic:

```text
Question-2/
|
|-- main.c                         Application entry point and main loop
|-- button_fsm.h                   Public FSM interface and data types
|-- button_fsm.c                   FSM, debounce, LED control, and logs
|-- board_config.h                 Board pins and active-low definitions
|-- simple_button_baremetal.c      Generated example module
|-- simple_button_baremetal.h      Interface for the example module
|-- autogen/                       Simplicity Studio generated sources
|-- config/                        SDK and peripheral configuration headers
|-- cmake_gcc/                     CMake build configuration and build files
|-- Doxyfile                      Doxygen configuration
|-- docs/                          Generated HTML documentation
`-- readme.md                     Project documentation
```

### Runtime Flow

The firmware follows this execution flow:

```text
Reset
	|
	v
sl_platform_init()
	|
	v
sl_driver_init()
	|
	v
sl_service_init()
	|
	v
sl_internal_app_init()
	|
	v
Configure GPIO and Sleep Timer
	|
	v
Initialize FSM and debounce filter
	|
	v
Read button -> Debounce -> Update FSM -> Control LED
	^                                      |
	|______________________________________|
```

The generated `sl_event_handler.c` file provides the Silicon Labs initialization functions. The application calls these functions from `main.c` before using the GPIO, Sleep Timer, or debug logger.

## Project Files

### `main.c`

Contains the application entry point. It initializes the Silicon Labs platform, drivers, VCOM, logger, GPIO, and Sleep Timer. The main loop reads the button, applies debounce, and updates the state machine.

### `button_fsm.h`

Defines the public interface of the state-machine module:

- the button states;
- the FSM context structure;
- the debounce-filter structure;
- public function prototypes.

### `button_fsm.c`

Centralizes board-specific definitions:

```c
#define BUTTON_PORT  gpioPortB
#define BUTTON_PIN   2U
#define LED_PORT     gpioPortD
#define LED_PIN      2U
#define LED_OFF      1U
#define LED_ON       0U
```

If the button or LED is connected to different pins, this is the main file that must be updated.

### `cmake_gcc/Question-2.cmake`

Lists the C source files used by the build. The `button_fsm.c` module is included in this list so it is compiled and linked into the firmware.

### `autogen/` and `config/`

Contain files generated by Simplicity Studio and configuration files for the SDK components, including GPIO, EUSART/VCOM, Sleep Timer, clocks, and power management.

Files in `autogen/` should not be edited manually because they may be replaced when the project is regenerated.

## Debug Logs

The `app_log_info()` and `app_log_error()` calls are included for debugging only. They report:

- application startup;
- the `OFF` to `ON` transition;
- the `ON` to `PROTECTED` transition and the measured press duration;
- the `PROTECTED` to `OFF` transition after 10 seconds;
- invalid FSM states.

The messages are sent through the VCOM/EUSART interface. The current serial configuration is:
- flow control: none.

These logs are not required for the button-state logic and can be disabled or removed in a production firmware build.
```c
/**
 * @brief Updates the button state machine.
 * @param fsm Pointer to the FSM context.
 * @param current_time_ms Current time in milliseconds.
 * @param button_pressed Debounced button state.
 */
void button_fsm_update(ButtonFSM_t *fsm,
		       uint32_t current_time_ms,
		       bool button_pressed);
```

The existing `Doxyfile` is configured to document `main.c`, `button_fsm.c`, `button_fsm.h`, and `board_config.h`. The generated output is HTML in the `docs` directory.

### Generate the Documentation

If a Doxyfile does not exist, create one with:

```powershell
doxygen -g Doxyfile
```

For this project, the Doxyfile already exists. Generate the documentation with:

```powershell
doxygen Doxyfile
```

The HTML documentation is generated at:

```text
docs/html/index.html
```

Open it from PowerShell with:

```powershell
Start-Process docs/html/index.html
```

The generated website provides navigation through the documented files, functions, structures, enumerations, parameters, and return values.

> Note: Doxygen must be installed and available in the system `PATH`. Verify the installation with `doxygen --version`.

## Build

Build the firmware using the existing CMake build directory:

```powershell
cmake --build cmake_gcc/build
```

The generated firmware can then be programmed onto the board using the Simplicity Studio programming tools.

## Public Repository

The source code is organized so it can be shared in a public GitHub repository. The repository should include the source files, `Doxyfile`, `readme.md`, and the board/state-machine images. Generated build outputs and local IDE metadata can be excluded with a `.gitignore` file.

## Summary

This solution fulfills the requirements by implementing a generic C state machine with `OFF`, `ON`, and `PROTECTED` states. It detects the button state, measures the press duration, keeps the system protected for 10 seconds after release, and returns to `OFF` automatically. The EFR32MG24-specific GPIO and timer code is isolated from the state-machine logic, making the design easier to maintain and adapt to another embedded platform.

O botao e configurado como entrada com pull-up. Portanto, a leitura `0` representa botao pressionado e a leitura `1` representa botao solto.

O LED possui logica ativa em nivel baixo:

- `0`: LED ligado;
- `1`: LED desligado.

### Imagem da placa

Inserir aqui a imagem da placa utilizada, identificando o EFR32, o botao, o LED e os pinos usados.

Sugestao de arquivo: `docs/images/placa-efr32mg24.jpg`.

## Organizacao dos arquivos

### `main.c`

Contem o ponto de entrada da aplicacao. Inicializa a plataforma Silicon Labs, os drivers, o VCOM, o logger, o GPIO e o Sleep Timer. Depois executa continuamente a leitura do botao, o filtro de debounce e a atualizacao da FSM.

### `button_fsm.h`

Define a interface publica do modulo da FSM:

- os estados do botao;
- a estrutura de contexto da FSM;
- a estrutura do filtro de debounce;
- os prototipos das funcoes publicas.

### `button_fsm.c`

Contem a implementacao da maquina de estados, do filtro de debounce e do controle do LED. Tambem registra no console as transicoes da FSM.

### `board_config.h`

Centraliza as definicoes relacionadas ao hardware da placa:

```c
#define BUTTON_PORT  gpioPortB
#define BUTTON_PIN   2U
#define LED_PORT     gpioPortD
#define LED_PIN      2U
#define LED_OFF      1U
#define LED_ON       0U
```

Se o botao ou o LED forem ligados a outros pinos, essa e a principal configuracao que deve ser alterada.

### `cmake_gcc/Question-2.cmake`

Lista os arquivos `.c` que fazem parte do build. O arquivo `button_fsm.c` foi adicionado nessa lista para que o novo modulo seja compilado e ligado ao firmware.

### `autogen/` e `config/`

Contem arquivos gerados pelo Simplicity Studio e configuracoes dos componentes do SDK, incluindo GPIO, EUSART/VCOM, Sleep Timer, clock e gerenciamento de energia.

Os arquivos gerados em `autogen/` nao devem ser editados manualmente, pois podem ser substituidos quando o projeto for regenerado.

## Maquina de estados

A FSM possui tres estados:

- `BUTTON_STATE_OFF`: LED desligado e sistema aguardando um pressionamento;
- `BUTTON_STATE_ON`: botao pressionado e LED ligado;
- `BUTTON_STATE_PROTECTED`: botao foi solto e o sistema permanece protegido por 10 segundos.

O fluxo e:

```text
BUTTON_STATE_OFF
	| botao pressionado
	v
BUTTON_STATE_ON
	| botao solto
	v
BUTTON_STATE_PROTECTED
	| 10 segundos decorridos
	v
BUTTON_STATE_OFF
```

### Funcionamento

No estado `BUTTON_STATE_OFF`, o LED e desligado. Quando o pressionamento passa pelo filtro de debounce, a FSM salva o instante do pressionamento, liga o LED e muda para `BUTTON_STATE_ON`.

No estado `BUTTON_STATE_ON`, o LED continua ligado. A duracao do pressionamento e calculada pela diferenca entre o tempo atual e o tempo salvo no inicio do pressionamento. Quando o botao e solto, essa duracao e registrada, o instante da soltura e salvo e a FSM muda para `BUTTON_STATE_PROTECTED`.

No estado `BUTTON_STATE_PROTECTED`, o LED permanece ligado durante 10 segundos. Quando o tempo termina, a FSM retorna para `BUTTON_STATE_OFF` e desliga o LED.

### Imagem da FSM

Inserir aqui a imagem do diagrama da maquina de estados.

Sugestao de arquivo: `docs/images/button-fsm.png`.

## Debounce por software

O botao mecanico pode oscilar eletricamente durante alguns milissegundos ao ser pressionado ou solto. Para evitar que uma unica acao seja interpretada como varias, o projeto utiliza um filtro de debounce nao bloqueante.

O filtro espera o sinal permanecer estavel por `50 ms` antes de atualizar o estado validado. Enquanto isso, o programa continua executando o loop principal.

## Temporizacao

O projeto utiliza o **Sleep Timer** do Silicon Labs:

```c
sl_sleeptimer_init();
```

O tempo atual e obtido em ticks e convertido para milissegundos:

```c
sl_sleeptimer_tick_to_ms(sl_sleeptimer_get_tick_count());
```

Esse tempo e usado para:

- confirmar o debounce de `50 ms`;
- medir a duracao do pressionamento;
- controlar o periodo de protecao de `10 s`.

Nao e utilizado `delay()` nem uma espera bloqueante. A aplicacao continua verificando o botao enquanto compara os tempos.

## Logs de depuracao

As chamadas `app_log_info()` e `app_log_error()` servem somente para depuracao. Elas informam:

- inicializacao da aplicacao;
- transicao de `OFF` para `ON`;
- transicao de `ON` para `PROTECTED` e a duracao do pressionamento;
- transicao de `PROTECTED` para `OFF` depois de 10 segundos;
- estados invalidos da FSM.

As mensagens sao enviadas pela interface VCOM/EUSART configurada no projeto. A configuracao atual utiliza `115200`, 8 bits de dados, sem paridade, 1 stop bit e sem controle de fluxo.

Esses logs nao fazem parte da funcao principal do sistema e podem ser removidos ou desativados em uma versao final do firmware.

## Documentacao com Doxygen

O projeto utiliza comentarios no formato Doxygen, por exemplo:

```c
/**
 * @brief Atualiza a maquina de estados do botao.
 * @param fsm Ponteiro para o contexto da FSM.
 * @param current_time_ms Tempo atual em milissegundos.
 * @param button_pressed Estado filtrado do botao.
 */
void button_fsm_update(ButtonFSM_t *fsm,
		       uint32_t current_time_ms,
		       bool button_pressed);
```

Os comandos usados para gerar a documentacao sao executados na raiz do projeto.

### Criar um Doxyfile novo

Use este comando apenas se ainda nao existir um arquivo de configuracao:

```powershell
doxygen -g Doxyfile
```

Neste projeto o `Doxyfile` ja existe e esta configurado para:

- projeto: `Question-2 Button FSM`;
- entrada: `main.c`, `button_fsm.c`, `button_fsm.h` e `board_config.h`;
- saida: pasta `docs`;
- formato: HTML;
- LaTeX: desativado.

### Gerar a documentacao

```powershell
doxygen Doxyfile
```

O Doxygen cria a documentacao HTML em:

```text
docs/html/index.html
```

### Abrir a documentacao

No PowerShell:

```powershell
Start-Process docs/html/index.html
```

Tambem e possivel abrir manualmente o arquivo `docs/html/index.html` no navegador. A pagina inicial permite navegar pelos arquivos, funcoes, estruturas, enumeracoes e comentarios documentados.

## Compilacao

Para compilar o firmware usando o build CMake existente:

```powershell
cmake --build cmake_gcc/build
```

O firmware gerado pode ser gravado na placa usando as ferramentas de programacao do Simplicity Studio.

## Resumo

O projeto combina o EFR32MG24B310F1536IM48, um botao da placa, um LED externo, uma FSM, debounce por software, Sleep Timer e logs de depuracao. A separacao em `main.c`, `button_fsm.c`, `button_fsm.h` e `board_config.h` torna o codigo mais organizado, reutilizavel e facil de documentar.