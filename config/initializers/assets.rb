Rails.application.config.assets.version = "1.0"

# ActiveAdmin uniquement
Rails.application.config.assets.precompile += %w[ active_admin.css ]

# Pour charger les fichiers générés par esbuild/tailwind
Rails.application.config.assets.paths << Rails.root.join("app/assets/builds")
Rails.application.config.assets.precompile += %w[ application.js ]
