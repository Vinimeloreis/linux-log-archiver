# Linux Log Archiver

A simple Bash CLI tool for archiving log directories into compressed `.tar.gz` files with timestamped filenames and automatic execution using cron.

This project was built as part of the [roadmap.sh Log Archive Tool project](https://roadmap.sh/projects/log-archive-tool) to practice Linux, Bash scripting, file compression, and task scheduling.

## Features

* Archive a directory using `tar`
* Compress archives using gzip
* Generate timestamped archive filenames
* Validate whether the provided directory exists
* Automatically configure a cron job
* Prevent duplicate cron entries for the same directory

Archives follow the format:

```text
logs_archive_YYYYMMDD_HHMMSS.tar.gz
```

Example:

```text
logs_archive_20260903_213401.tar.gz
```

## Requirements

The tool requires a Linux environment with:

* Bash
* `tar`
* `cron`

## Usage

Clone the repository:

```bash
git clone <repository-url>
cd linux-log-archiver
```

Make the script executable:

```bash
chmod +x log-archive.sh
```

Run the script and provide the directory you want to archive:

```bash
./log-archive.sh <log-directory>
```

Example:

```bash
./log-archive.sh test-directory/
```

The script creates a compressed archive inside the configured archive directory.

## Cron Automation

When executed, the tool checks whether a cron entry already exists for the selected directory.

If no matching entry exists, it creates one to execute the archiver automatically.

You can inspect the currently configured cron jobs with:

```bash
crontab -l
```

You can manually edit them with:

```bash
crontab -e
```

## How It Works

The script follows a simple workflow:

1. Receives the log directory through the first CLI argument (`$1`).
2. Checks whether the directory exists.
3. Creates a `.tar.gz` archive using `tar`.
4. Adds the current date and time to the archive filename.
5. Checks whether a cron job already exists for the directory.
6. Creates the cron entry when necessary.


## Project Structure

```text
linux-log-archiver/
├── log-archive.sh
├── stored-logs/
└── README.md
```

`log-archive.sh` contains the archiving and cron logic, while `stored-logs/` is used to store the generated archives.

## License

This project is intended for educational purposes.
