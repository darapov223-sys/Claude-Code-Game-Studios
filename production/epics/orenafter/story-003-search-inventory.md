# Story 003: Обыск зданий и инвентарь

> **Epic**: Оренafter
> **Status**: Ready
> **Layer**: Core
> **Type**: Logic
> **Estimate**: M
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: [set by /dev-story when implementation begins]

## Context

**GDD**: `design/game-brief.md`
**Requirement**: Brief MVP feature 3 (обыск зданий: еда, медикаменты, оружие, хлам в инвентаре)

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH (docs/engine-reference/godot/VERSION.md: 4.7 is post-cutoff)
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP 3, Core loop), scoped to this story:*

- [ ] Игрок подходит к зданию и обыскивает его по кнопке
- [ ] Обыск находит предметы четырёх видов: еда, медикаменты, оружие, хлам
- [ ] Найденные предметы попадают в инвентарь
- [ ] Здание, которое уже обыскали, повторно не даёт предметов в тот же день
- [ ] Еда и медикаменты используются из инвентаря и меняют голод/здоровье (Story 002)
- [ ] Оружие можно взять в руки (для Story 006)
- [ ] Таблица предметов и шансов находок во внешнем конфиге
- [ ] Инвентарь виден игроку на экране

---

## Implementation Notes

- Предметы как `Resource` (`.tres`) или записи JSON; шансы выпадения в `assets/data/loot_config.json`.
- Зависимость от `Vitals` через сигнал или внедрение, без глобального одиночки.
- Баланс находок пока грубый; настраивается позже по игровым тестам.

---

## Out of Scope

*Handled by neighbouring stories — do not implement here:*

- Story 004: использование предметов в убежище (укрепление)
- Story 006: боевой урон оружием

---

## Files

- `src/inventory/inventory.gd`
- `src/inventory/item.gd`
- `src/world/searchable_building.gd`
- `assets/data/loot_config.json`
- `tests/unit/inventory/search_inventory_test.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above.*

---

## Test Evidence

**Story Type**: Logic
**Required evidence**:
- Logic: `tests/unit/inventory/search_inventory_test.gd` — must exist and pass (at `qa.level: minimal` tests are waived; advisory)

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: `production/epics/orenafter/story-001-walk-map.md`, `production/epics/orenafter/story-002-hunger-health.md`
- Unlocks: `production/epics/orenafter/story-004-shelter-day-night.md`, `production/epics/orenafter/story-006-zombies.md`
