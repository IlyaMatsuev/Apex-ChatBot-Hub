# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Project Overview

Apex ChatBot Hub is a Salesforce package for configuring and managing chatbots (Telegram, Viber) on the Salesforce platform. It provides:

- REST API webhook endpoints for messenger integration
- Automatic storage of chat and message data
- Extensible handler pattern for custom bot logic
- Support for Telegram and Viber messengers

## Build & Deployment Commands

```bash
# Deploy to existing org (requires configured subdomain)
./scripts/pkg-deploy.sh <org-username>

# Create new scratch org with package
./scripts/pkg-from-scratch.sh <devhub-username> <scratch-alias>

# Run all tests
sf apex run test --code-coverage --result-format human

# Run specific test class
sf apex run test --tests BotContextTest --result-format human

# Push source changes to scratch org
sf project deploy start

# Pull changes from org
sf project retrieve start
```

## Project Structure

```
├── src/
│   ├── main/
│   │   ├── default/classes/           # Core Apex classes
│   │   │   ├── api/                    # REST API endpoints
│   │   │   ├── bot-handlers/           # Handler interfaces and context
│   │   │   ├── controllers/            # LWC controllers
│   │   │   ├── entities/               # Data transfer objects
│   │   │   ├── enums/                  # Enum types
│   │   │   ├── logger/                 # Error logging
│   │   │   ├── models/                 # Domain models
│   │   │   ├── services/               # Business logic services
│   │   │   └── trigger-handlers/       # Trigger handler classes
│   │   ├── telegram/classes/           # Telegram-specific implementation
│   │   └── viber/classes/              # Viber-specific implementation
│   └── test/classes/                   # Unit test classes
├── scripts/                            # Deployment scripts
├── docs/                               # Documentation site
└── manual-tests/                       # Manual test handlers
```

## Key Patterns

### Service Pattern
Business logic is encapsulated in service classes:
- `BotService` - Base service with common bot features
- `TelegramBotService` / `ViberBotService` - Messenger-specific services
- `BotCalloutService` - HTTP callout handling

### Factory Pattern
`BotServiceFactory` creates service instances based on bot type.

### Handler Pattern
Custom bot logic is implemented via:
- `IBotHandler` - Interface for message handling
- `TelegramBotHandler` / `ViberBotHandler` - Abstract base classes

### Context Pattern
`BotContext` / `IBotContext` provides access to:
- Update event data
- Reply functionality
- Bot service
- Data persistence

### Fluent API
Services use method chaining:
```apex
context.reply().text('Hello');
context.reply().withKeyboard(keyboard).text('Choose option');
```

### JSON Payload
`BotJsonPayload` for flexible JSON handling:
```apex
BotJsonPayload payload = new BotJsonPayload()
    .set('key', 'value')
    .set('nested', new BotJsonPayload().set('inner', 'data'));
```

## Code Conventions

- **Access modifiers**: Use `private` by default, `public`/`global` when necessary
- **Naming**: PascalCase for classes, camelCase for methods/variables
- **Interfaces**: Prefix with `I` (e.g., `IBotHandler`, `IBotContext`)
- **Tests**: Use `@IsTest(isParallel = true)` annotation
- **Test naming**: `methodName_scenario_expectedResult`

## Testing

### Running Tests
```bash
# All tests with coverage
sf apex run test --code-coverage --result-format human

# Specific test class
sf apex run test --tests BotContextTest

# Tests matching pattern
sf apex run test --tests "Telegram*Test"
```

### Test Patterns
- Use `Test.startTest()` / `Test.stopTest()` for async operations
- Mock HTTP callouts with `Test.setMock()`
- Available mocks: `TelegramBotCalloutMock`, `ViberBotCalloutMock`

## Custom Objects

| Object | Purpose |
|--------|---------|
| `Bot__c` | Bot configuration (token, handler, type) |
| `Chat__c` | Chat/conversation records |
| `ChatUser__c` | User information |
| `ChatMessage__c` | Message history |

## Agent Workflow

This project uses Claude AI agents for development. See:
- `.claude/workflow.md` - Development workflow
- `.claude/agents/` - Agent role definitions

Workflow: Architect -> Developer -> Tester -> Reviewer -> Done
