LATEST_TAG=$(git describe --abbrev=0 --tags)
LATEST_VERSION=$(echo "$LATEST_TAG" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
if [ -n "$LATEST_VERSION" ]; then
    LATEST_VERSION="${LATEST_VERSION}"
else
    echo "Failed to extract version from tag: $LATEST_TAG" >&2; exit 1;
fi

 ALL_MESSAGES=$(git log 0.0.1..HEAD --format=%B | grep -E "\[.*\] \[(patch|minor|major)\] (feat|fix|refactor): .*")
 echo $ALL_MESSAGES