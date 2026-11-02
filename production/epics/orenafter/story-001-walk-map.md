# Story 001: Ходьба по карте

> **Epic**: Оренafter
> **Status**: In Progress
> **Layer**: Foundation
> **Type**: Visual/Feel
> **Estimate**: M
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: 2026-11-02

## Context

**GDD**: `design/game-brief.md`
**Requirement**: Brief MVP feature 1 (игрок ходит по карте сверху, 3 района Оренбурга)

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH (docs/engine-reference/godot/VERSION.md: 4.7 is post-cutoff)
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP 1, Core loop), scoped to this story:*

- [ ] Проект запускается: у `project.godot` задана главная сцена
- [ ] Игрок (2D, вид сверху) двигается по карте клавишами WASD/стрелками
- [ ] Движение работает и в браузере (веб-экспорт, Compatibility renderer)
- [ ] На карте три района, между ними можно перейти
- [ ] Игрока нельзя вывести за границы карты и сквозь стены зданий
- [ ] Камера следует за игроком
- [ ] Скорость и размер карты берутся из внешнего конфига, не из кода
- [ ] 60 fps на карте в браузере (бюджет кадра 16.6 мс)

---

## Implementation Notes

- Движок: Godot 4.7, GDScript со статической типизацией; перед использованием API сверяться с `docs/engine-reference/godot/`.
- Физика: Godot Physics 2D, `CharacterBody2D` для игрока.
- Карта собирается из простых блоков (заглушки), оформление в Story 007 и позже.

---

## Out of Scope

*Handled by neighbouring stories — do not implement here:*

- Story 002: голод и здоровье
- Story 003: обыск зданий
- Story 006: зомби

---

## Files

- `src/player/player.gd`
- `src/world/districts.gd`
- `src/world/map.tscn`
- `assets/data/world_config.json`
- `project.godot` (run/main_scene)

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above.*

---

## Test Evidence

**Story Type**: Visual/Feel
**Required evidence**:
- Visual/Feel: a retained screenshot in `production/qa/evidence/` + sign-off in `production/qa/evidence/001-walk-map-evidence.md`

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: None
- Unlocks: `production/epics/orenafter/story-002-hunger-health.md`, `production/epics/orenafter/story-003-search-inventory.md`
