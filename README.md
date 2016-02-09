# moonlight-retropie-config
Bash script to populate game list into folder for direct game launching with Moonlight through EmulationStation.

# Usage
The script can be called without any parameters if moonlight's auto discovery works for you (it did not for me).  If that does not work, you just pass the IP address of your GameStream host machine as follows:
```
./moonlight-retropie-config.sh 192.168.1.123
```
The script doesn't write anything to stdout, but it will call the `touch` command on each game listed by moonlight with the following path/filename template.
```
~/RetroPie/roms/moonlight/"${name}".game
```

# EmulationStation Setup
In order for it to actually show up in EmulationStation you need to add a new section to your `es_systems.cfg`.  Here is a sample to get you started:
```
  <system>
    <name>moonlight</name>
    <fullname>Moonlight</fullname>
    <path>/home/pi/RetroPie/roms/moonlight</path>
    <extension>.game</extension>
    <command>moonlight stream 192.168.1.123 -app "%BASENAME%"</command>
    <platform/>
    <theme>moonlight</theme>
  </system>

```
You most likely should have some other options at the end of the `<command>` section for resolution or controller mapping.  Please refer to the moonlight-embedded wiki for more information.
