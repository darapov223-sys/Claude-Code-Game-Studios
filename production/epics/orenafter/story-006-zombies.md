# Story 006: Зомби

> **Epic**: Оренafter
> **Status**: Ready
> **Layer**: Feature
> **Type**: Integration
> **Estimate**: L
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: [set by /dev-story when implementation begins]

## Context

**GDD**: `design/game-brief.md`
**Requirement**: Brief MVP feature 5 (зомби бродят по районам, атакуют вблизи; игрок убегает или бьёт в ближнем бою)

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH (docs/engine-reference/godot/VERSION.md: 4.7 is post-cutoff)
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP 5, Core loop), scoped to this story:*

- [ ] Зомби появляются в районах и бродят, пока не заметят игрока
- [ ] Заметив игрока рядом, зомби преследуют его
- [ ] Зомби атакуют вблизи и снижают здоровье игрока (Story 002)
- [ ] Игрок может убежать: зомби теряет его, если тот отошёл достаточно далеко
- [ ] Игрок бьёт оружием ближнего боя (Story 003) и убивает зомби за заданное число ударов
- [ ] Ночью зомби опаснее (больше или быстрее), чем днём
- [ ] Ночью зомби могут атаковать убежище; защита убежища (Story 004) уменьшает урон
- [ ] Число, скорость, урон и здоровье зомби во внешнем конфиге
- [ ] 60 fps при максимальном числе зомби в районе в браузере

---

## Implementation Notes

- Простой конечный автомат состояний: `wander → chase → attack`, возврат в `wander` при потере цели.
- Поиск пути в MVP не нужен: движение по прямой с обходом стен через `NavigationAgent2D` только если прямая оказывается недостаточной.
- Баланс будет много подстраиваться, значения не зашивать в код.

---

## Out of Scope

*Handled by neighbouring stories — do not implement here:*

- Story 005: что происходит, когда здоровье игрока на нуле
- Разные виды зомби, огнестрельное оружие, боссы (вне MVP)

---

## Files

- `src/enemies/zombie.gd`
- `src/enemies/zombie.tscn`
- `src/enemies/zombie_spawner.gd`
- `assets/data/zombie_config.json`
- `tests/integration/zombies/zombie_combat_test.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above.*

---

## Test Evidence

**Story Type**: Integration
**Required evidence**:
- Integration: `tests/integration/zombies/zombie_combat_test.gd` OR playtest doc (at `qa.level: minimal` tests are waived; advisory)

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: `production/epics/orenafter/story-002-hunger-health.md`, `production/epics/orenafter/story-003-search-inventory.md`, `production/epics/orenafter/story-004-shelter-day-night.md`
- Unlocks: `production/epics/orenafter/story-007-dark-humor.md`
