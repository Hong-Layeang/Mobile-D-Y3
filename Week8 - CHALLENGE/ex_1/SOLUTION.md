# Weather Seasons App - Solution

## STEP 1 - Identify widgets you need for this app

| Widget | Type | Arguments | State |
|--------|------|-----------|-------|
| MyApp | StatelessWidget | - | - |
| SeasonsScreen | StatelessWidget | - | - |
| SeasonCard | StatefulWidget | country: String, seasons: List<SeasonData> | currentSeasonIndex (if stateful) |

## STEP 2 - Identify the type data for each UI element

| UI Elements property | Value source |
|---------------------|--------------|
| SEASONS | Constant (String) |
| CAMBODIA | Constant (String - parameter) |
| Season image | State (changes on tap) |

## Implementation Details

### Widgets Used:
1. **MyApp** (StatelessWidget): Main application widget that sets up MaterialApp
2. **SeasonsScreen** (StatelessWidget): Main screen containing the layout
3. **SeasonCard** (StatefulWidget): Individual country card that cycles through seasons when tapped

### Data Structure:
- **SeasonData**: A model class containing:
  - `icon`: IconData (for weather icon)
  - `backgroundColor`: Color (for season background)
  - `treeColor`: Color (for tree appearance)

### State Management:
- **currentSeasonIndex** (State): Tracks which season is currently displayed
  - Changes when user taps on the card
  - Cycles through 4 seasons (0-3 index)

### User Interaction:
- Tapping on a season card advances to the next season
- Cycles back to the first season after the last one
