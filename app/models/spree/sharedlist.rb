class Spree::Sharedlist < ActiveRecord::Base
  belongs_to :user, class_name: Spree.user_class
  has_many :shared_products, dependent: :destroy
  has_many :shared_with_user, dependent: :destroy
  has_many :shared_users, through: :shared_with_user, source: :user

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  ## FIXME_NISH use friendly_id

  validates :name, presence: true

  def include?(variant_id)
    shared_products.select { |sp| sp.variant_id == variant_id.to_i }.any?
  end

  ## FIXME Confirm this
  def should_generate_new_friendly_id?
    name_changed? || super
  end

  def checkout(order)
    errors = ''
    shared_products.each do |sp|
      errors += sp.add_to_current_order(order)
    end
    errors
  end

end
