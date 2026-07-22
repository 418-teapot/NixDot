# Load environment variables from a dotenv file into `$env`.
#
# Parses `KEY=VALUE` pairs, skipping blank lines and `#` comments,
# then merges the result into the current environment via `load-env`.
@example "load the default ./.env" { load-dotenv }
@example "load an explicit file" { load-dotenv ./config/.env }
def load-dotenv [file: string = ".env"] {
    open $file | lines
    | where not ($it | str starts-with "#")
    | where $it != ""
    | parse -r '(?P<key>[^=]+)=(?P<value>.+)'
    | transpose -r -d
    | load-env
}
