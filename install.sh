#!/bin/sh -l

suffix = "";
if [ "$2" != "stable" ]
then
    suffix="$2"
fi

mono_Suffix = "";
monoDotSuffix = "";
if [ "$3" != "true" ]
then
    mono_Suffix="_mono"
    monoDotSuffix=".mono"
fi

mkdir ~/.cache
mkdir -p ~/.config/godot
wget https://downloads.tuxfamily.org/godotengine/$1${suffix}/mono/Godot_v$1-$2${mono_Suffix}_linux_headless_64.zip
unzip Godot_v$1-$2${mono_Suffix}_linux_headless_64.zip
sudo mv Godot_v$1-$2${mono_Suffix}_linux_headless_64/Godot_v$1-$2${mono_Suffix}_linux_headless.64 /usr/local/bin/godot
sudo mv Godot_v$1-$2${mono_Suffix}_linux_headless_64/GodotSharp /usr/local/bin/GodotSharp
rm -f Godot_v$1-$2${mono_Suffix}_linux_headless_64.zip

if ["$4" == "true"]
then 
    wget https://downloads.tuxfamily.org/godotengine/$1${suffix}/mono/Godot_v$1-$2${mono_Suffix}_export_templates.tpz
    mkdir -p ~/.local/share/godot/templates/$1.$2${monoDotSuffix} \
    unzip Godot_v$1-$2${mono_Suffix}_export_templates.tpz \
    mv templates/* ~/.local/share/godot/templates/$1.$2${monoDotSuffix} \
    rm -f Godot_v$1-$2${mono_Suffix}_export_templates.tpz
fi