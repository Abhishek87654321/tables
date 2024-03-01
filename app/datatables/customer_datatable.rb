# class CustomerDatatable < AjaxDatatablesRails::ActiveRecord

#   def view_columns
#     # Declare strings in this format: ModelName.column_name
#     # or in aliased_join_table.column_name format
#     @view_columns ||= {
#       # id: { source: "User.id", cond: :eq },
#       # name: { source: "User.name", cond: :like }
#     }
#   end

#   def data
#     records.map do |record|
#       {
#         # example:
#         # id: record.id,
#         # name: record.name
#       }
#     end
#   end

#   def get_raw_records
#     # insert query here
#     # User.all
#   end

# end


class CustomerDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: 'Customer.id' },
      name: { source: 'Customer.name', cond: :like, searchable: true },
      age: { source: 'Customer.age', searchable: false },
      city: { source: 'Customer.city' },
      gender: { source: 'Customer.gender', searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        age: record.age,
        city: record.city,
        gender: record.gender,
        DT_RowId: record.id # Unique identifier for each table row will be automatically generated.
      }
    end
  end

  def get_raw_records
    Customer.all
  end
end