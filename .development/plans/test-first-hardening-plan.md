# Tests-First Hardening Plan (Scope C)

## Goal and Scope
- Achieve **100% branch coverage** for `app/**` plus directly used support code in active runtime paths.
- Keep work **tests-only first** (no behavior-changing production refactors unless required for testability and approved).
- Keep `bundle exec rubocop` passing with **no new exceptions** in `.rubocop_todo.yml`.

## Coverage Baseline and Enforcement
- Update coverage setup in [`/Users/daviddoolin/src/contact/spec/spec_helper.rb`](/Users/daviddoolin/src/contact/spec/spec_helper.rb):
  - Enable branch coverage (`enable_branch_coverage`).
  - Define coverage groups for visibility (`Controllers`, `Models`, `Mailers`).
  - Configure strict minimums for scope-C files only, ending at 100/100 line+branch.
- Add dedicated config file [`/Users/daviddoolin/src/contact/.simplecov`](/Users/daviddoolin/src/contact/.simplecov) to centralize filters/groups/minimums and avoid drift.
- CI plan in [`/Users/daviddoolin/src/contact/.github/workflows/ci.yml`](/Users/daviddoolin/src/contact/.github/workflows/ci.yml):
  - Keep existing RSpec gate.
  - Add coverage artifact upload for `coverage/` (HTML + JSON) to inspect branch misses per PR.
  - Enforce failure on coverage threshold miss through SimpleCov exit status.

## High-Impact Branch Coverage Additions
- Expand controller branch tests in [`/Users/daviddoolin/src/contact/spec/controllers/email_contacts_controller_spec.rb`](/Users/daviddoolin/src/contact/spec/controllers/email_contacts_controller_spec.rb):
  - Cover `respond_to` format branches (`html` and `xml`) for `index/show/new/create/update/destroy`.
  - Cover authenticated/unauthenticated decision branches consistently.
  - Cover create/update success and failure branches for each relevant format.
- Add integration-level branch checks in [`/Users/daviddoolin/src/contact/spec/requests/email_contacts_spec.rb`](/Users/daviddoolin/src/contact/spec/requests/email_contacts_spec.rb):
  - Ensure request behavior for root/contact/thankyou/create paths reflects branch intent and avoids controller-only blind spots.
- Strengthen mail delivery branch observability:
  - In request/controller specs, include at least one path where `deliver` is not stubbed and assert deliveries with test mailer mode.

## Hardening Through Tests (No New Runtime Features)
- Add/adjust tests to pin security/reliability behavior already expected by app config:
  - Production secret handling behavior from [`/Users/daviddoolin/src/contact/config/application.rb`](/Users/daviddoolin/src/contact/config/application.rb).
  - Access-control decisions in `EmailContactsController`.
  - Routing expectations for non-routable/admin/devise paths to avoid accidental exposure regressions.
- Keep existing legacy/unrouted areas out of denominator for this iteration unless runtime-proven:
  - `lib/**` patches (e.g., SMTP monkey patch) and non-active controller overrides stay out for iteration 1.

## RuboCop Safety Rails
- Before and after each test batch, run `bundle exec rubocop` and fix style in changed/new specs.
- Do not add new excludes or cop disables in `.rubocop_todo.yml` without explicit approval.
- Prefer small, targeted test files/examples to avoid metric offenses (block length/method length/line length).

## Execution Sequence
- Phase 1: Enable branch coverage plumbing + artifact visibility.
- Phase 2: Close branch gaps in `EmailContactsController` specs first (largest branch surface).
- Phase 3: Add request/mailer checks that validate real delivery and route-level behavior.
- Phase 4: Tighten thresholds to 100% for scope C and keep CI green.
- Phase 5: Publish coverage delta + uncovered list for deciding iteration 2 scope expansion.

## Iteration-2 Candidate Expansion (Later)
- Revisit denominator to include selected legacy `lib/**` paths or unused controllers only after decision.
- If included, add targeted tests or deprecate/remove dead paths by separate approval.
