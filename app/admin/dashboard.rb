ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
       column do
         panel "Reported Feeds" do
              Feed.all.map do |feed|
                if feed.reported.empty?
                  div class:"feed" do
                    div class:'tweet-image' do
                      if feed.user.avatar.attached?
                        image_tag(feed.user.avatar, class: "avatar-image")
                      else
                        image_tag("/assets/avatar.png", class: "avatar-image")
                      end
                    end
                    div class:'tweet-time' do
                      feed.time
                    end
                    div class:'tweet-username' do
                      feed.user.username
                    end
                    div class:'tweet-text' do
                      feed.text
                    end
                    if feed.image.attached?
                      image_tag(feed.image, class:"feed-image")
                    end
                    div class:'buttons' do
                      link_to 'Destroy', feed, method: :delete, data: { confirm: 'Are you sure?' }
                    end
                  end                       
                end
              end
         end
       end
     end
  end 
end