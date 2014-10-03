ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Temperature" do
          date_range = 1.day.ago.beginning_of_day..Time.now

          readings = Reading.
                      temperature.
                      where(created_at: date_range).
                      order :created_at

          readings = readings.group_by do |reading|
            reading.created_at.to_date
          end

          lines = readings.inject([]) do |metrics, (date, grouped)|
            name = date.strftime "%A"

            data = grouped.inject({}) do |hash, reading|
              timestamp = reading.created_at.strftime("%I:%M%p")
              hash.update timestamp => reading.value
            end

            line = { name: name, data: data }
            metrics << line
          end

          line_chart lines, min: 68, max: 95, discrete: true
        end
      end
    end
  end
end
