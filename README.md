# DaVinci Resolve Scripts
<!-- <div>
    <picture><img src=".github/README/Banner.png" width="1024" height="170"></picture>
    <div>
        <a href="https://ko-fi.com/CathRTic_tv"><img align="right" src="https://img.shields.io/badge/Support%20me%20on%20Ko--fi-%231F6FEBFF?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBmaWxsPSIjZmZmZmZmIiBkPSJNMTEuMzUxIDIuNzE1Yy0yLjcgMC00Ljk4Ni4wMjUtNi44My4yNkMyLjA3OCAzLjI4NSAwIDUuMTU0IDAgOC42MWMwIDMuNTA2LjE4MiA2LjEzIDEuNTg1IDguNDkzYzEuNTg0IDIuNzAxIDQuMjMzIDQuMTgyIDcuNjYyIDQuMTgyaC44M2M0LjIwOSAwIDYuNDk0LTIuMjM0IDcuNjM3LTRhOS41IDkuNSAwIDAgMCAxLjA5MS0yLjMzOEMyMS43OTIgMTQuNjg4IDI0IDEyLjIyIDI0IDkuMjA4di0uNDE1YzAtMy4yNDctMi4xMy01LjUwNy01Ljc5Mi01Ljg3Yy0xLjU1OC0uMTU2LTIuNjUtLjIwOC02Ljg1Ny0uMjA4bTAgMS45NDdjNC4yMDggMCA1LjA5LjA1MiA2LjU3MS4xODJjMi42MjQuMzExIDQuMTMgMS41ODQgNC4xMyA0di4zOWMwIDIuMTU2LTEuNzkyIDMuODQ0LTMuODcgMy44NDRoLS45MzVsLS4xNTYuNjQ5Yy0uMjA4IDEuMDEzLS41OTcgMS44MTgtMS4wMzkgMi41NDZjLS45MDkgMS40MjgtMi41NDUgMy4wNjQtNS45MjIgMy4wNjRoLS44MDVjLTIuNTcxIDAtNC44MzEtLjg4My02LjA3OC0zLjE5NWMtMS4wOS0yLTEuMjk4LTQuMTU1LTEuMjk4LTcuNTA2YzAtMi4xODEuODU3LTMuNDAyIDMuMDEyLTMuNzE0YzEuNTMzLS4yMzMgMy41NTktLjI2IDYuMzktLjI2bTYuNTQ3IDIuMjg3Yy0uNDE2IDAtLjY1LjIzNC0uNjUuNTQ2djIuOTM1YzAgLjMxMS4yMzQuNTQ1LjY1LjU0NWMxLjMyNCAwIDIuMDUxLS43NTQgMi4wNTEtMnMtLjcyNy0yLjAyNi0yLjA1Mi0yLjAyNm0tMTAuMzkuMTgyYy0xLjgxOCAwLTMuMDEzIDEuNDgtMy4wMTMgMy4xNDJjMCAxLjUzMy44NTggMi44NTcgMS45NDkgMy44OTdjLjcyNy43MDEgMS44NyAxLjQyOSAyLjY0OSAxLjg5NmExLjQ3IDEuNDcgMCAwIDAgMS41MDcgMGMuNzgtLjQ2NyAxLjkyMi0xLjE5NSAyLjYyMy0xLjg5NmMxLjExNy0xLjAzOSAxLjk3NC0yLjM2NCAxLjk3NC0zLjg5N2MwLTEuNjYyLTEuMjQ3LTMuMTQyLTMuMDM5LTMuMTQyYy0xLjA2NSAwLTEuNzkyLjU0NS0yLjMzOCAxLjI5OGMtLjQ5My0uNzUzLTEuMjQ2LTEuMjk4LTIuMzEyLTEuMjk4Ii8+PC9zdmc+"></a>
    </div>
</div> -->

<br>

<p align="center">
    <a href="#installation-and-usage-guide">Installation and Usage</a>
    <br>
    <a href="#exporting-subtitles">Subtitles</a> •
    <a href="#exporting-timestamps">Timestamps</a> •
    <a href="#exporting-thumbnails">Thumbnails</a> •
    <a href="#updating-markers">Markers</a>
</p>

<br>

My DaVinci Resolve scripts, designed to streamline editing and uploading.
- Export Subtitles and Timestamps as `.json` files for use in custom content management systems.
- Generate Timeline Markers from Chapters prefixed with `"## "` and applied colors based on a configured `.env` file.



<br>

## Installation and Usage Guide
To install these scripts, download and extract this project, then move it into your DaVinci Resolve Scripts folder.

On Windows, this is typically located at:\
`%AppData%/Blackmagic Design/DaVinci Resolve/Support/Fusion/Scripts/Utility/`

<br>

> [!NOTE]
> This project requires you to create and configure a `.env` file, using `.env.example` as a reference.\
> The value of `OUTPUT_PATH` should be an absolute path.

<br>

To run the scripts, open your project and navigate to:\
`Workspace > Scripts > CathRTic - Resolve Scripts > [Script to run]`

<p align="center">
    <img src=".github/README/workspace-dropdown.png" width="720">
</p>

You can also assign these scripts to keyboard shortcuts by going to:\
`DaVinci Resolve > Keyboard Customization > Commands > Application > Workspace > Scripts > CathRTic - Resolve Scripts > [Script to run]` 



<br>

## Exporting Subtitles
When running `"📤 Export All"` or `"📤 Export Subtitles"`, every Subtitle Track will be processed and exported as a series of `.json` files saved to: `[OUTPUT_PATH]/[Project Path]/[Project Name]/Metadata/`.

Subtitle Tracks named `"Subtitle 1"` or `"English"` (case insensitive) will be outputted as `subtitles.json`.\
All other Subtitle Tracks, for example `"French"`, will be outputted as `subtitles.french.json`.

<br>

Example `subtitles.json`:
```json
[{
    "text":"[audience welcoming applause]",
    "startHours":1,
    "startMinutes":0,
    "startSeconds":0,
    "startMilliseconds":0,
    "endHours":1,
    "endMinutes":0,
    "endSeconds":3,
    "endMilliseconds":566
  },{
    "text":">> SVEN GRUNDBERG: Thank you Junghun.\nAnd, hello everybody.",
    "startHours":1,
    "startMinutes":0,
    "startSeconds":7,
    "startMilliseconds":800,
    "endHours":1,
    "endMinutes":0,
    "endSeconds":10,
    "endMilliseconds":766
  },{ ...
```



<br>

## Exporting Timestamps
When running `"📤 Export All"` or `"📤 Export Timestamps"`, every `Cream` colored Timeline Marker (including Cream alt-colored Timeline Markers) will be exported as `timestamps.json` saved to: `[OUTPUT_PATH]/[Project Path]/[Project Name]/Metadata/`.

<br>

Example `timestamps.json`:
```json
[{
    "text":"Introduction",
    "startHours":1,
    "startMinutes":0,
    "startSeconds":0,
    "startMilliseconds":0
  },{
    "text":"Background",
    "startHours":1,
    "startMinutes":0,
    "startSeconds":50,
    "startMilliseconds":133
  },{ ...
```



<br>

## Exporting Thumbnails
When running `"📤 Export All"` or `"📤 Export Thumbnails"`, every `Cocoa` colored Timeline Marker (including Cocoa alt-colored Timeline Markers) will be processed to export a `.png` Frame Still saved to: `[OUTPUT_PATH]/[Project Path]/[Project Name]/Thumbnail/`.

Frame Stills are named with the format `FRAME STILL HH-MM-SS-FF.png`, where HH-MM-SS-FF represents the Timeline timecode in hours, minutes, seconds, and frames.



<br>

## Update Markers
When running `"🏷️ Update Markers"`, each Marker (or `.mp4` Chapter) prefixed with `"## "` in your project's Timeline Items gets copied to the main Timeline.

A generated Marker's color is picked from the `MARKER_[COLOR]` `.env` variables, with `_ALT` colors having a black dot in the middle. These are case insensitive, although the resulting Marker will always be uppercase. If a color is not found, the Marker defaults to Blue.

<br>

Example generated Markers:
<table align="center">
    <tr>
        <th>BEFORE</th>
        <th>AFTER</th>
    </tr>
    <tr>
        <td>
            <img src=".github/README/markers-before.png" width="720">
        </td>
        <td>
            <img src=".github/README/markers-after.png" width="720">
        </td>
    </tr>
</table>

> [!NOTE]
> Generated Markers will never override existing Markers on the Timeline
