DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Exclude actual dotfiles in this folder, such as .git, as well as the readme,
# the license, and the script itself
FILES=$(find $DIR -maxdepth 1 -mindepth 1 \
        -not -name ".*" \
        -not -name link.sh \
        -not -name README.md \
        -not -name LICENSE-MIT.txt )

COUNT=0
for FILE in $FILES; do
    FILE_BASE=$(basename $FILE)
    if [ -e ~/.$FILE_BASE ]; then
        echo "Skipped $FILE_BASE (exists)."
    else
        ln -s -h $FILE ~/.$FILE_BASE
        echo "Linked $FILE_BASE."
        COUNT=$((COUNT+1))
    fi
done

echo "\nLinked $COUNT files."
