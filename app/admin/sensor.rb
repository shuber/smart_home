ActiveAdmin.register Sensor do
  permit_params :name, :type

  index do
    column :type

    column "Last updated" do |sensor|
      since = time_ago_in_words sensor.created_at
      "#{since} ago"
    end

    column :name
    column :created_at
    column :id
    actions
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs do
      f.input :type, as: :select, collection: Sensor::TYPES
      f.input :name
    end

    f.actions
  end
end
