#!bin/bash
mkdir -p changeslogs


process_changelog() {

    PLACEHOLDER_CONTENT='<!-- ##CONTENT## -->'
    PLACEHOLDER_TITLE='<!-- ##TITLE## -->'

    local content_file="$1"
    local title="$2"
    local output_file="$3"

    local content=$(cat "$content_file")

    awk -v content="$content" -v title="$title" '
    {
        gsub(/<!-- ##CONTENT## -->/, content)
        gsub(/<!-- ##TITLE## -->/, title)
        print
    }' sources/_template_.html > "$output_file"
}


process_changelog "sources/changelog.html" "Changelogs" "changeslogs/changelog.html"

process_changelog "sources/changelog-ZH-CN.html" "更新日志" "changeslogs/changelog-ZH-CN.html"

process_changelog "sources/_index_.html" "Changelogs of Phonograph Plus" "changeslogs/index.html"
