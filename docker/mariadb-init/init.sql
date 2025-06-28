CREATE TABLE IF NOT EXISTS qbittorrent (
    id INT AUTO_INCREMENT PRIMARY KEY,
    torrent_hash VARCHAR(40) UNIQUE NOT NULL,
    name TEXT,
    tracker TEXT,
    category VARCHAR(50),
    status VARCHAR(50), -- e.g. downloading, completed, seeding
    added_on TIMESTAMP,
    completed_on TIMESTAMP,
    label VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS sonarr_series (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sonarr_id INT UNIQUE NOT NULL,
    series_title VARCHAR(255),
    path TEXT,
    season_folder BOOLEAN,
    monitored BOOLEAN
);

CREATE TABLE IF NOT EXISTS sonarr_episodes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sonarr_id INT NOT NULL,
    episode_number INT,
    season_number INT,
    monitored BOOLEAN,
    FOREIGN KEY (sonarr_id) REFERENCES sonarr_series(sonarr_id)
);

CREATE TABLE IF NOT EXISTS radarr (
    id INT AUTO_INCREMENT PRIMARY KEY,
    radarr_id INT UNIQUE NOT NULL,

    title VARCHAR(255),
    path TEXT,
    quality_profile VARCHAR(100),
    monitored BOOLEAN
);