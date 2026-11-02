# Story 005: Победа и проигрыш

> **Epic**: Оренafter
> **Status**: Ready
> **Layer**: Core
> **Type**: Logic
> **Estimate**: S
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: [set by /dev-story when implementation begins]

## Context

**GDD**: `design/game-brief.md`
**Requirement**: Brief MVP feature 6 (победа — эвакуация на день N; проигрыш — показатель на нуле)

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH (docs/engine-reference/godot/VERSION.md: 4.7 is post-cutoff)
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (Player goal & fail state), scoped to this story:*

- [ ] Победа: игрок доживает до дня N (эвакуация), и забег завершается победой
- [ ] Проигрыш: голод на нуле завершает забег поражением
- [ ] Проигрыш: здоровье на нуле завершает забег поражением
- [ ] Экран итога показывает результат (победа/поражение) и сколько дней продержался игрок
- [ ] Из экрана итога можно начать новый забег с чистого состояния
- [ ] День N берётся из внешнего конфига

---

## Implementation Notes

- Слушает сигналы нуля (Story 002) и смены дня (Story 004); решение о конце забега принимает один узел `RunState`.
- Сохранений между сессиями нет (Out of scope в брифе), «новый забег» = перезагрузка сцены.

---

## Out of Scope

*Handled by neighbouring stories — do not implement here:*

- Story 006: причины урона и сама гибель от зомби
- Сохранение результатов между сессиями (вне MVP)

---

## Files

- `src/run/run_state.gd`
- `src/ui/end_screen.tscn`
- `assets/data/run_config.json`
- `tests/unit/run/win_lose_test.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above.*

---

## Test Evidence

**Story Type**: Logic
**Required evidence**:
- Logic: `tests/unit/run/win_lose_test.gd` — must exist and pass (at `qa.level: minimal` tests are waived; advisory)

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: `production/epics/orenafter/story-002-hunger-health.md`, `production/epics/orenafter/story-004-shelter-day-night.md`
- Unlocks: None
