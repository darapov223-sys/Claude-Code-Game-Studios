# Story 002: Голод и здоровье

> **Epic**: Оренafter
> **Status**: Ready
> **Layer**: Core
> **Type**: Logic
> **Estimate**: S
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: [set by /dev-story when implementation begins]

## Context

**GDD**: `design/game-brief.md`
**Requirement**: Brief MVP feature 2 (два показателя: голод и здоровье)

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH (docs/engine-reference/godot/VERSION.md: 4.7 is post-cutoff)
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP 2, Player goal & fail state), scoped to this story:*

- [ ] Есть два показателя: голод и здоровье, у каждого максимум и текущее значение
- [ ] Голод падает со временем с заданной скоростью
- [ ] Еда повышает голод (сытость); значение не превышает максимума
- [ ] Лечение повышает здоровье; значение не превышает максимума
- [ ] Урон снижает здоровье; значение не уходит ниже нуля
- [ ] Показатель на нуле подаёт сигнал (для Story 005)
- [ ] Показатели видны игроку на экране (HUD)
- [ ] Скорость падения голода и максимумы берутся из внешнего конфига

---

## Implementation Notes

- Отдельный узел/ресурс `Vitals`: методы и сигналы без зависимости от сцены, чтобы тестировать отдельно.
- Сигналы в snake_case в прошедшем времени (`hunger_depleted`, `health_changed`).
- Значения в `assets/data/survival_config.json`.

---

## Out of Scope

*Handled by neighbouring stories — do not implement here:*

- Story 003: предметы, которые дают еду и лечение
- Story 005: экран победы/проигрыша

---

## Files

- `src/survival/vitals.gd`
- `src/ui/hud.tscn`
- `assets/data/survival_config.json`
- `tests/unit/survival/hunger_health_test.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above.*

---

## Test Evidence

**Story Type**: Logic
**Required evidence**:
- Logic: `tests/unit/survival/hunger_health_test.gd` — must exist and pass (at `qa.level: minimal` tests are waived; advisory)

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: `production/epics/orenafter/story-001-walk-map.md`
- Unlocks: `production/epics/orenafter/story-003-search-inventory.md`, `production/epics/orenafter/story-005-win-lose.md`
