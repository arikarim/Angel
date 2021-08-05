require 'test_helper'

class MeasurmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measurment = measurments(:one)
  end

  test 'should get index' do
    get measurments_url, as: :json
    assert_response :success
  end

  test 'should create measurment' do
    assert_difference('Measurment.count') do
      post measurments_url,
           params: { measurment: { date: @measurment.date,
                                   measure_id: @measurment.measure_id, number: @measurment.number,
                                   user_id: @measurment.user_id } }, as: :json
    end

    assert_response 201
  end

  test 'should show measurment' do
    get measurment_url(@measurment), as: :json
    assert_response :success
  end

  test 'should update measurment' do
    patch measurment_url(@measurment),
          params: { measurment: { date: @measurment.date, measure_id: @measurment.measure_id,
                                  number: @measurment.number, user_id: @measurment.user_id } }, as: :json
    assert_response 200
  end

  test 'should destroy measurment' do
    assert_difference('Measurment.count', -1) do
      delete measurment_url(@measurment), as: :json
    end

    assert_response 204
  end
end
