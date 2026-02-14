# Development Workflow

This document defines the agent-based workflow for implementing changes in the Apex ChatBot Hub project.

## Workflow Diagram

```
┌──────────────┐
│   Architect  │ ◄──────────────────────────────────────┐
│  (Planning)  │                                        │
└──────┬───────┘                                        │
       │ Implementation Plan                            │
       ▼                                                │
┌──────────────┐                                        │
│   Developer  │ ◄──────────────────────────┐           │
│(Implementing)│                            │           │
└──────┬───────┘                            │           │
       │ Code Changes                       │           │
       ▼                                    │           │
┌──────────────┐                            │           │
│    Tester    │ ◄──────────────┐           │           │
│  (Testing)   │                │           │           │
└──────┬───────┘                │           │           │
       │ Test Coverage          │           │           │
       ▼                        │           │           │
┌──────────────┐                │           │           │
│   Reviewer   │────────────────┴───────────┴───────────┘
│  (Reviewing) │    Feedback (based on issue type)
└──────┬───────┘
       │ Approved
       ▼
┌──────────────┐
│     Done     │
└──────────────┘
```

## Workflow Steps

### 1. Architect Phase

The Architect agent analyzes the requirements and designs the solution.

**Input**: Issue description, feature request, or bug report

**Activities**:
- Study the existing project architecture
- Analyze the impact of proposed changes
- Design the implementation approach
- Identify affected components
- Define the implementation steps
- Consider test strategy

**Output**: Implementation plan with detailed steps

**Reference**: [.claude/agents/architect.md](agents/architect.md)

### 2. Developer Phase

The Developer agent implements the code changes based on the Architect's plan.

**Input**: Implementation plan from Architect

**Activities**:
- Implement Apex classes and triggers
- Create or modify LWC components
- Follow existing code patterns
- Handle errors appropriately
- Add necessary documentation

**Output**: Code changes ready for testing

**Reference**: [.claude/agents/developer.md](agents/developer.md)

### 3. Tester Phase

The Tester agent writes comprehensive unit tests for the implemented changes.

**Input**: Code changes from Developer

**Activities**:
- Create test classes for new code
- Update existing tests if needed
- Cover positive and negative scenarios
- Test edge cases and bulk operations
- Ensure minimum 75% code coverage

**Output**: Test classes with comprehensive coverage

**Reference**: [.claude/agents/tester.md](agents/tester.md)

### 4. Reviewer Phase

The Reviewer agent analyzes all changes and provides feedback.

**Input**: Implementation plan, code changes, and tests

**Activities**:
- Review code quality and patterns
- Verify security best practices
- Check performance considerations
- Validate test coverage
- Ensure all references exist

**Output**: Review feedback or approval

**Reference**: [.claude/agents/reviewer.md](agents/reviewer.md)

## Feedback Routing

The Reviewer routes feedback based on the type of issue:

| Issue Type | Route To | Examples |
|------------|----------|----------|
| Architectural | Architect | Design flaws, pattern violations, wrong abstraction |
| Implementation | Developer | Bugs, missing functionality, code quality issues |
| Testing | Tester | Missing test cases, inadequate coverage, test quality |

## Completion Criteria

A task is considered complete when:

1. Implementation matches the requirements
2. Code follows project patterns and conventions
3. Security best practices are followed
4. Test coverage meets requirements (>= 75%)
5. Reviewer approves all changes
6. Code compiles without errors
7. All tests pass
