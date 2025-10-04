
# Elixir Data Ingest and Reporting Engine

## Project Overview

This project is a functional data processing pipeline built in Elixir. It reads data from a CSV file, cleans it, transforms it into a structured format, aggregates the data, and prepares it for reporting. The primary focus is on using pure functions, data transformation, and functional programming concepts available in Elixir, such as `Enum`, `Stream`, and OTP building blocks like `GenServer` and `Application`.

The project is structured as a series of challenges, guiding the developer through the implementation of each module. The modules include:

*   **Parser:** Reads and parses the raw CSV data.
*   **Record:** Defines the data structure for a single record.
*   **Transformer:** Converts raw data into structured `Record` structs.
*   **Validator:** Validates the transformed records and filters out invalid data.
*   **Aggregator:** Groups and aggregates the validated records.
*   **Pipeline:** Orchestrates the entire data flow from parsing to aggregation.
*   **Report:** Formats the aggregated data for presentation.
*   **CLI:** Provides a command-line interface to run the data ingestion process.
*   **File:** Handles file I/O, including efficient streaming of large files.
*   **Config:** Manages configuration, such as column mappings, using a `GenServer`.
*   **Application:** Defines the OTP application and its supervision tree.

## Building and Running

### Dependencies

The project's dependencies are managed by `mix`. To install them, run:

```bash
mix deps.get
```

### Compiling and Running

To compile the project, run:

```bash
mix compile
```

The primary entry point for running the data ingestion pipeline is through the `ElixirDataIngest.CLI` module. The `README.md` provides a step-by-step guide to implementing the full pipeline. Once implemented, you can run the pipeline from the interactive Elixir shell:

```bash
iex -S mix
```

Inside the shell, you can call the functions in the `ElixirDataIngest.CLI` module to run the pipeline.

### Testing

The project is set up with a `test` directory. To run the tests, use the following command:

```bash
mix test
```

## Development Conventions

*   **Functional Programming:** The project emphasizes a purely functional approach. Use pure functions and immutable data structures wherever possible.
*   **Pipelines:** Use the `|>` pipe operator to create clean and readable data transformation pipelines.
*   **Pattern Matching and Guards:** Use pattern matching and guards to handle different data shapes and conditions.
*   **OTP:** Use OTP building blocks like `GenServer` and `Application` for state management and supervision.
*   **Testing:** Write tests for each module to ensure correctness.
*   **Documentation:** Add `@moduledoc` and `@doc` attributes to your modules and functions to document the code.
