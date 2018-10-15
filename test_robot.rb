require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    test_robot = Robot.new
    test_robot.needs_repairs = true
    test_robot.foreign_model = true
    expected_result = 1
    # act
    repair_and_foreign = test_robot.station
    # assert
    assert_equal(expected_result, repair_and_foreign)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    test_robot = Robot.new
    test_robot.needs_repairs = true
    test_robot.vintage_model = true
    expected_result = 2
    # act
    repair_and_foreign = test_robot.station
    # assert
    assert_equal(expected_result, repair_and_foreign)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    test_robot = Robot.new
    test_robot.needs_repairs = true
    expected_result = 3
    # act
    repair_and_foreign = test_robot.station
    # assert
    assert_equal(expected_result, repair_and_foreign)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    test_robot = Robot.new
    test_robot.needs_repairs = false
    expected_result = 4
    # act
    repair_and_foreign = test_robot.station
    # assert
    assert_equal(expected_result, repair_and_foreign)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    test_robot = Robot.new
    test_robot.todos = []
    expected_result = -1
    # act
    proritize_task_empty = test_robot.prioritize_tasks
    # assert
    assert_equal(expected_result, proritize_task_empty)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    test_robot = Robot.new
    test_robot.todos = [1,2,7,5]
    expected_result = 7
    # act
    proritize_task = test_robot.prioritize_tasks
    # assert
    assert_equal(expected_result, proritize_task)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    test_robot = Robot.new
    test_robot.day_off = "sunday"
    expected_result = false
    # act
    test_workday = test_robot.workday?("sunday")
    # assert
    assert_equal(expected_result, test_workday)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    test_robot = Robot.new
    test_robot.day_off = "sunday"
    expected_result = true
    # act
    test_workday = test_robot.workday?("monday")
    # assert
    assert_equal(expected_result, test_workday)
  end

end
