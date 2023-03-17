# pytest

usage: pytest [options] [file_or_dir] [file_or_dir] [...]

positional arguments:

file_or_dir

```
general:
-k EXPRESSION         Only run tests which match the given substring expression. An expression is a Python evaluatable expression where all names are substring-matched against test names and their parent classes. Example: -k      
'test_method or test_other' matches all test functions and classes whose name contains 'test_method' or 'test_other', while -k 'not test_method' matches those that don't contain 'test_method' in their names.
-k 'not test_method and not test_other' will eliminate the matches. Additionally keywords are matched to classes and functions containing extra names in their 'extra_keyword_matches' set, as well as functions
which have names assigned directly to them. The matching is case-insensitive.
-m MARKEXPR           Only run tests matching given mark expression. For example: -m 'mark1 and not mark2'.
--markers             show markers (builtin, plugin and per-project ones).
-x, --exitfirst       Exit instantly on first error or failed test
--fixtures, --funcargs
Show available fixtures, sorted by plugin appearance (fixtures with leading '_' are only shown with '-v')
--fixtures-per-test   Show fixtures per test
--pdb                 Start the interactive Python debugger on errors or KeyboardInterrupt
--pdbcls=modulename:classname
Specify a custom interactive Python debugger for use with --pdb.For example: --pdbcls=IPython.terminal.debugger:TerminalPdb
--trace               Immediately break when running each test
--capture=method      Per-test capturing method: one of fd|sys|no|tee-sys
-s                    Shortcut for --capture=no
--runxfail            Report the results of xfail tests as if they were not marked
--lf, --last-failed   Rerun only the tests that failed at the last run (or all if none failed)
--ff, --failed-first  Run all tests, but run the last failures first. This may re-order tests and thus lead to repeated fixture setup/teardown.
--nf, --new-first     Run tests from new files first, then the rest of the tests sorted by file mtime
--cache-show=[CACHESHOW]
Show cache contents, don't perform collection or tests. Optional argument: glob (default: '*').
--cache-clear         Remove all cache contents at start of test run
--lfnf={all,none}, --last-failed-no-failures={all,none}
Which tests to run with no previously (known) failures
--sw, --stepwise      Exit on test failure and continue from last failing test next time
--sw-skip, --stepwise-skip
Ignore the first failing test but stop on the next failing test. Implicitly enables --stepwise.

Reporting:
--durations=N         Show N slowest setup/test durations (N=0 for all)
--durations-min=N     Minimal duration in seconds for inclusion in slowest list. Default: 0.005.
-v, --verbose         Increase verbosity
--no-header           Disable header
--no-summary          Disable summary
-q, --quiet           Decrease verbosity
--verbosity=VERBOSE   Set verbosity. Default: 0.
-r chars              Show extra test summary info as specified by chars: (f)ailed, (E)rror, (s)kipped, (x)failed, (X)passed, (p)assed, (P)assed with output, (a)ll except passed (p/P), or (A)ll. (w)arnings are enabled by default  
(see --disable-warnings), 'N' can be used to reset the list. (default: 'fE').
--disable-warnings, --disable-pytest-warnings
Disable warnings summary
-l, --showlocals      Show locals in tracebacks (disabled by default)
--no-showlocals       Hide locals in tracebacks (negate --showlocals passed through addopts)
--tb=style            Traceback print mode (auto/long/short/line/native/no)
--show-capture={no,stdout,stderr,log,all}
Controls how captured stdout/stderr/log is shown on failed tests. Default: all.
--full-trace          Don't cut any tracebacks (default is to cut)
--color=color         Color terminal output (yes/no/auto)
--code-highlight={yes,no}
Whether code should be highlighted (only if --color is also enabled). Default: yes.
--pastebin=mode       Send failed|all info to bpaste.net pastebin service
--junit-xml=path      Create junit-xml style report file at given path
--junit-prefix=str    Prepend prefix to classnames in junit-xml output

pytest-warnings:
-W PYTHONWARNINGS, --pythonwarnings=PYTHONWARNINGS
Set which warnings to report, see -W option of Python itself
--maxfail=num         Exit after first num failures or errors
--strict-config       Any warnings encountered while parsing the `pytest` section of the configuration file raise errors
--strict-markers      Markers not registered in the `markers` section of the configuration file raise errors
--strict              (Deprecated) alias to --strict-markers
-c file               Load configuration from `file` instead of trying to locate one of the implicit configuration files
--continue-on-collection-errors
Force test execution even if collection errors occur
--rootdir=ROOTDIR     Define root directory for tests. Can be relative path: 'root_dir', './root_dir', 'root_dir/another_dir/'; absolute path: '/home/user/root_dir'; path with variables: '$HOME/root_dir'.

collection:
--collect-only, --co  Only collect tests, don't execute them
--pyargs              Try to interpret all arguments as Python packages
--ignore=path         Ignore path during collection (multi-allowed)
--ignore-glob=path    Ignore path pattern during collection (multi-allowed)
--deselect=nodeid_prefix
Deselect item (via node id prefix) during collection (multi-allowed)
--confcutdir=dir      Only load conftest.py's relative to specified dir
--noconftest          Don't load any conftest.py files
--keep-duplicates     Keep duplicate tests
--collect-in-virtualenv
Don't ignore tests in a local virtualenv directory
--import-mode={prepend,append,importlib}
Prepend/append to sys.path when importing test modules and conftest files. Default: prepend.
--doctest-modules     Run doctests in all .py modules
--doctest-report={none,cdiff,ndiff,udiff,only_first_failure}
Choose another output format for diffs on doctest failure
--doctest-glob=pat    Doctests file matching pattern, default: test*.txt
--doctest-ignore-import-errors
Ignore doctest ImportErrors
--doctest-continue-on-failure
For a given doctest, continue to run after the first failure
```

### test session debugging and configuration:

|                                              | Описание                                                                                                                                                                                           |
|----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| --basetemp=dir                               | Base temporary directory for this test run. (Warning: this directory is removed if it exists.)                                                                                                     |
| -V, --version                                | Display pytest version and information about plugins. When given twice, also display information about plugins.                                                                                    |
| -h, --help                                   | Show help message and configuration info                                                                                                                                                           |
| -p name                                      | Early-load given plugin module name or entry point (multi-allowed). To avoid loading of plugins, use the `no:` prefix, e.g. `no:doctest`.                                                          |
| --trace-config                               | Trace considerations of `conftest.py` files                                                                                                                                                        |
| --debug=[DEBUG_FILE_NAME]                    | Store internal tracing debug information in this log file. This file is opened with 'w' and truncated as a result, care advised. Default: `pytestdebug.log`.                                       |
| -o OVERRIDE_INI, --override-ini=OVERRIDE_INI | Override ini option with `"option=value"` style, e.g. `-o xfail_strict=True -o cache_dir=cache`.                                                                                                   |
| --assert=MODE                                | Control assertion debugging tools. 'plain' performs no assertion debugging. 'rewrite' (the default) rewrites assert statements in test modules on import to provide assert expression information. |
| --setup-only                                 | Only setup fixtures, do not execute tests                                                                                                                                                          |
| --setup-show                                 | Show setup of fixtures while executing tests                                                                                                                                                       |
| --setup-plan                                 | Show what fixtures and tests would be executed but don't execute anything                                                                                                                          |

### logging:

|                                             | Описание                                                                                                                                                  |
|---------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| --log-level=LEVEL                           | Level of messages to catch/display. Not set by default, so it depends on the root/parent log handler's effective level, where it is "WARNING" by default. |
| --log-format=LOG_FORMAT                     | Log format used by the logging module                                                                                                                     |
| --log-date-format=LOG_DATE_FORMAT           | Log date format used by the logging module                                                                                                                |
| --log-cli-level=LOG_CLI_LEVEL               | CLI logging level                                                                                                                                         |
| --log-cli-format=LOG_CLI_FORMAT             | Log format used by the logging module                                                                                                                     |
| --log-cli-date-format=LOG_CLI_DATE_FORMAT   | Log date format used by the logging module                                                                                                                |
| --log-file=LOG_FILE                         | Path to a file when logging will be written to                                                                                                            |
| --log-file-level=LOG_FILE_LEVEL             | Log file logging level                                                                                                                                    |
| --log-file-format=LOG_FILE_FORMAT           | Log format used by the logging module                                                                                                                     |
| --log-file-date-format=LOG_FILE_DATE_FORMAT | Log date format used by the logging module                                                                                                                |
| --log-auto-indent=LOG_AUTO_INDENT           | Auto-indent multiline messages passed to the logging module. Accepts `true&#124;on`, `false&#124;off` or an integer.                                      |

### coverage reporting with distributed testing support:

|                       | Описание                                                                                                                                                                                                                                                                                          |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| --cov=[SOURCE]        | Path or package name to measure during execution (multi-allowed). Use --cov= to not do any source filtering and record everything.                                                                                                                                                                |
| --cov-reset           | Reset cov sources accumulated in options so far.                                                                                                                                                                                                                                                  |
| --cov-report=TYPE     | Type of report to generate: term, term-missing, annotate, html, xml, lcov (multi-allowed). term, term-missing may be followed by ":skip-covered". annotate, html, xml and lcov may be followed by ":DEST" where DEST specifies the output location. Use --cov-report= to not generate any output. |
| --cov-config=PATH     | Config file for coverage. Default: .coveragerc                                                                                                                                                                                                                                                    |
| --no-cov-on-fail      | Do not report coverage if test run fails. Default: False                                                                                                                                                                                                                                          |
| --no-cov              | Disable coverage report completely (useful for debuggers). Default: False                                                                                                                                                                                                                         |
| --cov-fail-under=MIN  | Fail if the total coverage is less than MIN.                                                                                                                                                                                                                                                      |
| --cov-append          | Do not delete coverage but append to current. Default: False                                                                                                                                                                                                                                      |
| --cov-branch          | Enable branch coverage.                                                                                                                                                                                                                                                                           |
| --cov-context=CONTEXT | Dynamic contexts to use. "test" for now.                                                                                                                                                                                                                                                          |

### [pytest] ini-options in the first pytest.ini|tox.ini|setup.cfg file found:

```
markers (linelist):   Markers for test functions
empty_parameter_set_mark (string):Default marker for empty parametersets
norecursedirs (args): Directory patterns to avoid for recursion
testpaths (args):     Directories to search for tests when no files or directories are given on the command line
filterwarnings (linelist):Each line specifies a pattern for warnings.filterwarnings. Processed after -W/--pythonwarnings.
usefixtures (args):   List of default fixtures to be used with this project
python_files (args):  Glob-style file patterns for Python test module discovery
python_classes (args):
Prefixes or glob names for Python test class discovery
python_functions (args):
Prefixes or glob names for Python test function and method discovery
disable_test_id_escaping_and_forfeit_all_rights_to_community_support (bool):
Disable string escape non-ASCII characters, might cause unwanted side effects(use at your own risk)
console_output_style (string):
Console output: "classic", or with additional progress information ("progress" (percentage) | "count")
xfail_strict (bool):  Default for the strict parameter of xfail markers when not given explicitly (default: False)
enable_assertion_pass_hook (bool):
Enables the pytest_assertion_pass hook. Make sure to delete any previously generated pyc cache files.
junit_suite_name (string):
Test suite name for JUnit report
junit_logging (string):Write captured log messages to JUnit report: one of no|log|system-out|system-err|out-err|all
junit_log_passing_tests (bool):Capture log information for passing tests to JUnit report:
junit_duration_report (string):Duration time to report: one of total|call
junit_family (string):Emit XML for schema: one of legacy|xunit1|xunit2
doctest_optionflags (args):Option flags for doctests
doctest_encoding (string):Encoding used for doctest files
cache_dir (string):   Cache directory path
log_level (string):   Default value for --log-level
log_format (string):  Default value for --log-format
log_date_format (string):Default value for --log-date-format
log_cli (bool):       Enable log display during test run (also known as "live logging")
log_cli_level (string):Default value for --log-cli-level
log_cli_format (string):Default value for --log-cli-format
log_cli_date_format (string):Default value for --log-cli-date-format
log_file (string):    Default value for --log-file
log_file_level (string):Default value for --log-file-level
log_file_format (string):Default value for --log-file-format
log_file_date_format (string):Default value for --log-file-date-format
log_auto_indent (string):Default value for --log-auto-indent
pythonpath (paths):   Add paths to sys.path
faulthandler_timeout (string):Dump the traceback of all threads if a test takes more than TIMEOUT seconds to finish
addopts (args):       Extra command line options
minversion (string):  Minimally required pytest version
required_plugins (args):Plugins that must be present for pytest to run

Environment variables:
PYTEST_ADDOPTS           Extra command line options
PYTEST_PLUGINS           Comma-separated plugins to load during startup
PYTEST_DISABLE_PLUGIN_AUTOLOAD Set to disable plugin auto-loading
PYTEST_DEBUG             Set to enable debug tracing of pytest's internals```
```

## markers:

```shell
pytest --markers
```
| Функции                                                                                         | Описание                                                                                                                                                                                                                                                                                                                                                                    |
|-------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `@pytest.mark.no_cover`                                                                         | disable coverage for this test.                                                                                                                                                                                                                                                                                                                                             |
| `@pytest.mark.filterwarnings(warning)`                                                          | add a warning filter to the given test.                                                                                                                                                                                                                                                                                                                                     |
| `@pytest.mark.skip(reason=None)`                                                                | skip the given test function with an optional reason. Example: skip(reason="no way of currently testing this") skips the test.                                                                                                                                                                                                                                              |
| `@pytest.mark.skipif(condition, ..., *, reason=...)`                                            | skip the given test function if any of the conditions evaluate to True. Example: skipif(sys.platform == 'win32') skips the test if we are on the win32 platform.                                                                                                                                                                                                            |
| `@pytest.mark.xfail(condition, ..., *, reason=..., run=True, raises=None, strict=xfail_strict)` | mark the test function as an expected failure if any of the conditions evaluate to True. Optionally specify a reason for better reporting and run=False if you don't even want to execute the test function. If only specific exception(s) are expected, you can list them in raises, and if the test fails in other ways, it will be reported as a true failure.           |
| `@pytest.mark.parametrize(argnames, argvalues)`                                                 | call a test function multiple times passing in different arguments in turn. argvalues generally needs to be a list of values if argnames specifies only one name or a list of tuples of v alues if argnames specifies multiple names. Example: @parametrize('arg1', [1,2]) would lead to two calls of the decorated test function, one with arg1=1 and another with arg1=2. |
| `@pytest.mark.usefixtures(fixturename1, fixturename2, ...)`                                     | mark tests as needing all of the specified fixtures.                                                                                                                                                                                                                                                                                                                        |
| `@pytest.mark.tryfirst`                                                                         | mark a hook implementation function such that the plugin machinery will try to call it first/as early as possible. DEPRECATED, use @pytest.hookimpl(tryfirst=True) instead.                                                                                                                                                                                                 |
| `@pytest.mark.trylast`                                                                          | mark a hook implementation function such that the plugin machinery will try to call it last/as late as possible. DEPRECATED, use @pytest.hookimpl(trylast=True) instead.                                                                                                                                                                                                    |

## fixtures:

```shell
pytest --fixtures
```

| Функции                                     | Описание                                                                                                                                              |
|---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `cache`                                     | Возвращает объект кеша, который может сохранять состояние между сеансами тестирования.                                                                |
| `capsys`                                    | Включите захват текста при записи в `sys.stdout` и `sys.stderr`.                                                                                      |
| `capsysbinary`                              | Enable bytes capturing of writes to `sys.stdout` and `sys.stderr`.                                                                                    |
| `capfd`                                     | Enable text capturing of writes to file descriptors `1` and `2`.                                                                                      |
| `capfdbinary`                               | Enable bytes capturing of writes to file descriptors `1` and `2`.                                                                                     |
| `doctest_namespace [session scope]`         | Fixture that returns a :py:class:`dict` that will be injected into the namespace of doctests.                                                         |
| `pytestconfig [session scope]`              | Session-scoped fixture that returns the session's :class:`pytest.Config` object.                                                                      |
| `record_property`                           | Add extra properties to the calling test.                                                                                                             |
| `record_xml_attribute`                      | Add extra xml attributes to the tag for the calling test.                                                                                             |
| `record_testsuite_property [session scope]` | Record a new `<property>` tag as child of the root `<testsuite>`.                                                                                     |
| `tmpdir_factory [session scope]`            | Return a :class:`pytest.TempdirFactory` instance for the test session.                                                                                |
| `tmpdir`                                    | Return a temporary directory path object which is unique to each test function invocation, created as a subdirectory of the base temporary directory. |
| `caplog`                                    | Access and control log capturing.                                                                                                                     |
| `monkeypatch`                               | A convenient fixture for monkey-patching.                                                                                                             |
| `recwarn`                                   | Return a :class:`WarningsRecorder` instance that records all warnings emitted by test functions.                                                      |
| `no_cover`                                  | A pytest fixture to disable coverage.                                                                                                                 |
| `cov`                                       | A pytest fixture to provide access to the underlying coverage object.                                                                                 |                                                                          
