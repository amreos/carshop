require "administrate/base_dashboard"

class ListingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    img_url: Field::String,
    make: Field::String,
    model: Field::String,
    mpg: Field::String.with_options(searchable: false),
    price: Field::String.with_options(searchable: false),
    registered: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :img_url,
    :make,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    #:id,
    :title,
    :img_url,
    :make,
    :model,
    :mpg,
    :price,
    #:registered,
    #:created_at,
    #:updated_at,
    :description,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :img_url,
    :make,
    :model,
    :mpg,
    :price,
    :registered,
    :description,
  ].freeze

  # Overwrite this method to customize how listings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(listing)
  #   "Listing ##{listing.id}"
  # end
end
