require 'test_helper'

class DayJobsControllerTest < ActionController::TestCase
  setup do
    @day_job = day_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:day_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create day_job" do
    assert_difference('DayJob.count') do
      post :create, day_job: { apply_instruction: @day_job.apply_instruction, company_name: @day_job.company_name, description: @day_job.description, email: @day_job.email, higher_bound: @day_job.higher_bound, is_published: @day_job.is_published, location: @day_job.location, lower_bound: @day_job.lower_bound, title: @day_job.title, url: @day_job.url }
    end

    assert_redirected_to day_job_path(assigns(:day_job))
  end

  test "should show day_job" do
    get :show, id: @day_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @day_job
    assert_response :success
  end

  test "should update day_job" do
    patch :update, id: @day_job, day_job: { apply_instruction: @day_job.apply_instruction, company_name: @day_job.company_name, description: @day_job.description, email: @day_job.email, higher_bound: @day_job.higher_bound, is_published: @day_job.is_published, location: @day_job.location, lower_bound: @day_job.lower_bound, title: @day_job.title, url: @day_job.url }
    assert_redirected_to day_job_path(assigns(:day_job))
  end

  test "should destroy day_job" do
    assert_difference('DayJob.count', -1) do
      delete :destroy, id: @day_job
    end

    assert_redirected_to day_jobs_path
  end
end
