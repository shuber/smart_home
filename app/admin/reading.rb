ActiveAdmin.register Reading do
  permit_params :sensor_id, :value, :created_at

  index do
    column :type do |reading|
      reading.sensor.type
    end

    column :sensor

    column "Timestamp" do |reading|
      reading.created_at.to_s(:db)
    end

    column :value

    column :comments do |reading|
      comments = ActiveAdmin::Comment.where(resource: reading).map(&:body)
      items = comments.inject('') { |html, body| html << "<li>#{body}</li>" }
      ul = "<ul>#{items}</ul>"
      ul.html_safe
    end

    column :id
    actions
  end

  controller do
    skip_before_filter :verify_authenticity_token, only: :create
  end
end
