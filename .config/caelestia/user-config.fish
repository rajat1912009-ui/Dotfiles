# Force Caelestia Scheme Defaults
set -gx CAELESTIA_SCHEME_MODE "dynamic"
set -gx CAELESTIA_SCHEME_VARIANT "vibrant"

# Set scheme directly via CLI on interactive shell startup
if status is-interactive
    caelestia scheme set -m dynamic -v vibrant >/dev/null 2>&1
end
