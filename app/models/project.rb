class Project < ApplicationRecord
	has_attached_file :image, styles: { large: "700x700", medium: "400x400>", thumb: "300x200#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	extend FriendlyId
	friendly_id :title, use: :slugged
end
