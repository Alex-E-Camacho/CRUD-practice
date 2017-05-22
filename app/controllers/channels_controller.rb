get '/channels' do
  @channels = Channel.all
  erb :'/channels/index'
end

get '/channels/:channel_id' do
  @channel = Channel.find_by(id: params[:channel_id])
  erb :'/channels/show'
end
