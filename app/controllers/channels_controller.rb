get '/channels' do
  @channels = Channel.all
  erb :'/channels/index'
end

get '/channels/:channel_id' do
  @channel = Channel.find_by(id: params[:channel_id])
  erb :'/channels/show'
end

post '/channels/:channel_id/subscriptions' do
  require_user
  Subscription.create(user_id: current_user.id, channel_id: params[:channel_id])
  redirect "/channels/#{params[:channel_id]}"
end

delete '/channels/:channel_id/subscriptions' do
  require_user
  Subscription.where(user_id: current_user.id, channel_id: params[:channel_id])[0].destroy
  redirect "channels/#{params[:channel_id]}"
end
