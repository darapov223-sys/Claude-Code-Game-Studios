# Story 007: Чёрный юмор в текстах

> **Epic**: Оренafter
> **Status**: Ready
> **Layer**: Presentation
> **Type**: Config/Data
> **Estimate**: S
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: [set by /dev-story when implementation begins]

## Context

**GDD**: `design/game-brief.md`
**Requirement**: Brief MVP feature 7 (чёрный юмор в описаниях предметов и событий)

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH (docs/engine-reference/godot/VERSION.md: 4.7 is post-cutoff)
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP 7, tone), scoped to this story:*

- [ ] У каждого вида предмета (еда, медикаменты, оружие, хлам) есть описание в тоне чёрного юмора
- [ ] У каждого события (находка, нападение зомби, наступление ночи, победа, поражение) есть короткий текст
- [ ] Для частых событий несколько вариантов текста (минимум 3), чтобы не повторяться
- [ ] Тексты лежат во внешнем файле (строки), а не в коде
- [ ] Узнаваемые места Оренбурга упомянуты без прямых цитат из чужих произведений
- [ ] Тексты помещаются в интерфейс на экране 1280x720 без обрезания

---

## Implementation Notes

- Строки в `assets/data/text_ru.json` (позже через таблицу переводов Godot, если понадобится локализация).
- Тон — мрачная ирония, без насмешки над реальными жертвами.

---

## Out of Scope

*Handled by neighbouring stories — do not implement here:*

- Озвучка, музыка и оформление (вне MVP)
- Переводы на другие языки (вне MVP)

---

## Files

- `assets/data/text_ru.json`
- `src/ui/text_provider.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above.*

---

## Test Evidence

**Story Type**: Config/Data
**Required evidence**:
- Config/Data: smoke check pass (`production/qa/smoke-*.md`)

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: `production/epics/orenafter/story-003-search-inventory.md`, `production/epics/orenafter/story-006-zombies.md`
- Unlocks: None
