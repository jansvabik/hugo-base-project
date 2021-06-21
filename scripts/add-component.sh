#
# CREATE NEW PROJECT COMPONENT
#
# This will create necessary files for new component implmenetation. Those are:
# assets/sass/components/_component.scss, layouts/partials/components/component.html.
# It also adds the scss component file to the main.scss file so there is no human
# action required.
#

# name of the component to be added
name=$1

# corresponding files
sassfile="assets/sass/components/_$name.scss"
htmlfile="layouts/partials/components/$name.html"

# test the component name
if [ -z "$name" -a "$name" != " " ]; then
    echo "U must gimme the component name. Usage: make component name=cmpt-name"
fi

# test that the name is still unused (sass)
if [ -e $sassfile ]; then
    echo "This component file already exists: $sassfile"
    exit
fi

# test that the name is still unused (html)
if [ -e $htmlfile ]; then
    echo "This component file already exists: $htmlfile"
    exit
fi

# let's start
echo "Creating new component: $name..."

# create sass component file
echo ".c-$name {
    @include component-spacing;
}

.c-${name}__heading {
    @include component-heading;
}
" > $sassfile

# include the sass component file to the main.scss file
sed -i '' 's/\/\/ auto-add components/@import ".\/components\/'"$name"'.scss";\n\/\/ auto-add components/g' "assets/sass/main.scss"

# create html component file
echo "<div class=\"c-$name\">
    <div class=\"o-container\">
        <h2 class=\"c-${name}__heading\"></h2>
    </div>
</div>" > $htmlfile

# open created files for immediate editing
code $sassfile
code $htmlfile