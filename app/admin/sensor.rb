ActiveAdmin.register Sensor do
  permit_params :name, :type

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs do
      f.input :type, as: :select, collection: Sensor::TYPES
      f.input :name
    end

    f.actions
  end
end
