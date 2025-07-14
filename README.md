# 🧩 Sudoku Game —  (8088 Architecture)

A command-driven **Sudoku game** built for **8088 architecture**, with enhanced features:

- ✏️ Note-taking
- ⬅️ Move/Edit
- 🧹 Erase
- 🔊 Sound Effects
- 🎞️ Smooth Animations
- ⌨️ Command-based Input

> Designed for low-level hardware with direct BIOS and port control, this project blends logic, graphics, and real-mode programming in Assembly.

---

## 🎮 How to Play

### ✅ Controls (Command-Based Interface)

Use simple keyboard commands to interact with the Sudoku grid:

| Command | Usage | Description |
|---------|-------|-------------|
| `g r c v` | `g 1 1 5` | Place value `5` at row `1`, column `1` |
| `e r c` | `e 1 1` | Erase the value at row `1`, column `1` |
| `n r c v` | `n 2 3 7` | Add a note `7` at row `2`, column `3` |
| `z` |  | Erase all notes|


> `r` = row (1–9), `c` = column (1–9), `v` = value (1–9)

---
### 🎯 Difficulty Levels

The game offers **3 levels of difficulty**:

- 🟢 **Easy** – Fewer blank cells, ideal for beginners
- 🟡 **Medium** – Balanced challenge with moderate difficulty
- 🔴 **Hard** – Minimal starting clues, built for advanced players

At launch, the player selects the difficulty, and the board is initialized accordingly.

## 🛠️ Features

- ⌨️ **Command Interface** for intuitive grid control
- ✏️ **Note Mode** to mark possibilities
- 🧹 **Erase Mode** to remove entries
- 🔊 **Sound Feedback** for actions and errors
- 🎞️ **Smooth Transitions** using timing loops
- ✅ **Validation** of entries and Sudoku rules

---

## 🖥️ Platform & Setup

| Item          | Detail                                |
|-------------  |----------------------------------------|
| **Language**  | (8088 real-mode)                     |
| **Platform**  | DOS / DOSBox Emulator                |
| **Assembler** | NASM                                 |
| **Graphics**  | Animations built through hardware level             coding            |
| **Sound**     | PC Speaker (via OUT to ports)        |

