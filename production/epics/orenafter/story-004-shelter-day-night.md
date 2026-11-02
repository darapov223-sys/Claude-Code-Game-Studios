# Story 004: Убежище, день и ночь

> **Epic**: Оренafter
> **Status**: Ready
> **Layer**: Core
> **Type**: Integration
> **Estimate**: M
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: [set by /dev-story when implementation begins]

## Context

**GDD**: `design/game-brief.md`
**Requirement**: Brief MVP feature 4 (убежище: еда, лечение, сон, укрепление; смена дня и ночи)

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH (docs/engine-reference/godot/VERSION.md: 4.7 is post-cutoff)
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP 4, Core loop), scoped to this story:*

- [ ] В игре идут день и ночь: время суток меняется по таймеру
- [ ] Вечером игрок должен вернуться в убежище, иначе наступает ночь снаружи (опаснее)
- [ ] В убежище можно поесть (еда из инвентаря → голод)
- [ ] В убежище можно подлечиться (медикаменты → здоровье)
- [ ] Сон завершает день и начинает следующий; счётчик дней растёт
- [ ] Укрепление убежища тратит хлам и повышает защиту ночью
- [ ] Номер дня виден на экране
- [ ] Длина дня и стоимость укрепления во внешнем конфиге

---

## Implementation Notes

- Часы дня как отдельный узел с сигналами (`day_started`, `night_started`); остальные системы подписываются на них.
- Защита убежища — число, которое читает Story 006 (ночные нападения).

---

## Out of Scope

*Handled by neighbouring stories — do not implement here:*

- Story 005: условие победы на день N и проигрыш
- Story 006: нападения зомби на убежище и их поведение

---

## Files

- `src/world/day_cycle.gd`
- `src/shelter/shelter.gd`
- `src/shelter/shelter.tscn`
- `assets/data/shelter_config.json`
- `tests/integration/shelter/day_night_test.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above.*

---

## Test Evidence

**Story Type**: Integration
**Required evidence**:
- Integration: `tests/integration/shelter/day_night_test.gd` OR playtest doc (at `qa.level: minimal` tests are waived; advisory)

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: `production/epics/orenafter/story-002-hunger-health.md`, `production/epics/orenafter/story-003-search-inventory.md`
- Unlocks: `production/epics/orenafter/story-005-win-lose.md`, `production/epics/orenafter/story-006-zombies.md`
