# Project 1: Data Ingest and Reporting Engine

## Goal

Build a purely functional pipeline in Elixir to **read, clean, and aggregate data** from a theoretical CSV file for reporting.

This project emphasizes:

* **Pure functions**
* **Data transformation**
* **Functional iteration** with `Enum` and `Stream`
* **OTP building blocks** (GenServer, Application, Protocols)

---

## Setup

### Prerequisites

* [Elixir](https://elixir-lang.org/install.html) ≥ 1.15
* Matching [Erlang/OTP](https://www.erlang.org/downloads)
* (Optional) [asdf](https://asdf-vm.com) to manage versions

Verify:

```bash
elixir -v
```

### Create Project

```bash
mix new data_ingest
cd data_ingest
iex -S mix
```

You’ll implement modules inside `lib/data_ingest/`.

---

## Challenges by Module

### 1. `DataIngest.Parser` – Pattern Matching & Guards

* Write a function that accepts a CSV string and returns a list of lines.
* Handle edge cases:

  * Empty string → return `[]`.
  * Input with only whitespace → return `[]`.
* Use **pattern matching** and **guards** to make your function expressive.

---

### 2. `DataIngest.Parser` – Pipe Operator (`|>`)

* Refactor the parser from challenge 1 to use pipelines.
* Example: `input |> String.trim() |> String.split("\n", trim: true)`
* Goal: **Readable transformation chain**.

---

### 3. `DataIngest.Record` – Structs & `@enforce_keys`

* Define a `%DataIngest.Record{}` struct.
* Use `@enforce_keys` for required fields (like `id`, `date`, `amount`).
* This enforces correctness when building records.

---

### 4. `DataIngest.Transformer` – `Enum.map/2` & Map Updates

* Write a function that converts a list of **string cells** (like `["123", "2023-09-10", "45.67"]`) into a `%Record{}`.
* Use `Enum.map/2` to process lines into structs.
* Update maps with `%{record | field: new_value}` syntax.

---

### 5. `DataIngest.Validator` – `Enum.reject/2`

* Validate records.
* Reject if:

  * `id` is `nil` or empty.
  * `date` is invalid.
* Use `Enum.reject/2` to filter out bad data.

---

### 6. `DataIngest.Aggregator` – `Enum.group_by/3`

* Group valid records by a field (e.g., `region` or `category`).
* Explore `Enum.group_by(list, &(&1.region))`.

---

### 7. `DataIngest.Aggregator` – `Enum.reduce/3`

* For each group, reduce the list into totals.
* Example: Sum sales per region.
* Practice `Enum.reduce/3` to accumulate results.

---

### 8. `DataIngest.Pipeline` – `with` Expression

* Compose the Validator, Transformer, Aggregator.
* Use `with` for error handling:

  ```elixir
  with {:ok, parsed} <- parse(input),
       {:ok, records} <- transform(parsed) do
    aggregate(records)
  end
  ```
* Return clean error tuples (`{:error, reason}`) if something fails.

---

### 9. `DataIngest.Report` – Sorting

* Sort aggregated results.
* Use `Enum.sort_by/2` with tuple sorting:

  ```elixir
  Enum.sort_by(groups, & &1.total, :desc)
  ```

---

### 10. `DataIngest.CLI` – Custom Types

* Define a custom type with `@type`. Example:

  ```elixir
  @type report :: [{String.t(), number()}]
  ```
* Improves dialyzer specs and documentation.

---

### 11. `DataIngest.File` – `File.stream!/3`

* Switch from `File.read!` to `File.stream!` for memory efficiency.
* Streams allow line-by-line reading of large files.

---

### 12. `DataIngest.File` – `Stream.filter/2`

* Filter out:

  * Comment lines (e.g., starting with `#`).
  * Header row.
* Use `Stream.filter/2` before parsing.

---

### 13. `DataIngest.Config` – GenServer

* Build a `GenServer` to hold column configuration (e.g., `"id"`, `"region"`, `"amount"`).
* Implement `handle_call(:get_columns, _from, state)` to return config.

---

### 14. `DataIngest.Application` – Supervision Tree

* Ensure your `Config` GenServer starts under supervision.
* Update `application.ex` to supervise `DataIngest.Config`.

---

### 15. `DataIngest.Report.Presenter` – Protocols

* Implement `String.Chars` for your report struct.
* Define how it should be **printed to console** (e.g., formatted table).
* Example:

  ```elixir
  defimpl String.Chars, for: Report do
    def to_string(report), do: "Report: #{inspect(report)}"
  end
  ```

---

## Extension: Export

* Add a function to export the final report as CSV or integrate with Google Sheets API (optional advanced step).

