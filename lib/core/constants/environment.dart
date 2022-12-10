class Environment {
  static const baseUrl = 'nakama-ingatkan.vercel.app';

  static const loginUrl = 'login/api';
  static const registerUrl = 'login/register-api';

  // Profile
  static const editProfileUrl = 'profile/edit-profile';
  static const editTheme = 'profile/edit-theme';

  // Timeline
  static const getAllTimelines = 'timeline/';
  static const getTimeline = 'timeline/specific';
  static const createTimeline = 'timeline/create';
  static const updateTimeline = 'timeline/update';
  static const deleteTimeline = 'timeline/delete';

  // Activity
  static const getHistory = 'histori/histori';
  static const getActivity = 'activities/read_activities_api';
  static const postActivity = 'activities/create_activities_api';
  static const putActivity = 'activities/update_activities_api';
  static const deleteActivity = 'activities/delete_activities_api';
  static const finishActivity = 'activities/finish_activities_api';
}
