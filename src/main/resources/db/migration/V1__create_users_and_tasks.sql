CREATE TABLE users (
                       id UUID PRIMARY KEY,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(180) NOT NULL UNIQUE,
                       password_hash VARCHAR(255) NOT NULL,
                       role VARCHAR(20) NOT NULL DEFAULT 'USER',
                       created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks (
                       id UUID PRIMARY KEY,
                       title VARCHAR(120) NOT NULL,
                       completed BOOLEAN NOT NULL DEFAULT FALSE,
                       owner_id UUID NOT NULL REFERENCES users(id),
                       created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_tasks_owner_id ON tasks(owner_id);