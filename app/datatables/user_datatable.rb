class UserDatatable < AjaxDatatablesRails::Base

  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegators :@view, :form_authenticity_token, :link_to, :book_path, :form_for, :concat, :content_tag, :button_tag, :current_user, :image_tag, :asset_path


  def initialize(view)
    @view = view
  end

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ["users.first_name" ,"users.last_name" ,"users.email"]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ["users.first_name" ,"users.last_name" ,"users.email"]
  end

  private

  def data
    records.map do |record|
      [
        record.first_name,
        record.last_name,
        record.email
      ]
    end
  end

  def get_raw_records
    User.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
