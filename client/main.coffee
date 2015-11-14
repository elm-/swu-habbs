app.controller 'TodoCtrl', [
  '$scope'
  '$meteorCollection'
  '$ionicModal'
  '$state'
  '$rootScope'
  '$ionicSideMenuDelegate'
  '$ionicPopup'
  '$cordovaDatePicker'
  ($scope, $meteorCollection, $ionicModal, $state, $rootScope, $ionicSideMenuDelegate, $ionicPopup, $cordovaDatePicker) ->
    $scope.Orders = $scope.$meteorCollection(Orders)
    $scope.Projects = $scope.$meteorCollection(Projects)
    $scope.Tasks = $scope.$meteorCollection(Tasks)
    # A utility function for creating a new project
    # with the given projectTitle
    #
    #
    $scope.gotoOrder2 = ->
      $state.go("order2")

    $scope.goto1 = ->
      $state.go("order1")


    createProject = (projectTitle) ->
      newProject =
        title: projectTitle
        active: false
      $scope.Projects.save(newProject).then (res) ->
        if res
          $scope.selectProject newProject, $scope.Projects.length - 1
        return
      return

    # Called to create a new project

    $scope.newProject = ->
      $ionicPopup.prompt(
        title: 'New Project'
        subTitle: 'Name:').then (res) ->
        if res
          createProject res
        return
      return

    # Grab the last active, or the first project

    $scope.activeProject = ->
      activeProject = $scope.Projects[0]
      angular.forEach $scope.Projects, (v, k) ->
        if v.active
          activeProject = v
        return
      activeProject

    # Called to select the given project

    $scope.selectProject = (project, index) ->
      selectedProject = $scope.Projects[index]
      angular.forEach $scope.Projects, (v, k) ->
        v.active = false
        return
      selectedProject.active = true
      $ionicSideMenuDelegate.toggleLeft()
      return

    # Create our modal
    $ionicModal.fromTemplateUrl 'client/new-task.ng.html', ((modal) ->
      $scope.taskModal = modal
      return
    ),
      scope: $scope
      animation: 'slide-in-up'
    #Cleanup the modal when we are done with it!
    $scope.$on '$destroy', ->
      $scope.taskModal.remove()
      return

    $scope.createTask = (task) ->
      activeProject = $scope.activeProject()
      if !activeProject or !task.title
        return
      $scope.Tasks.save
        project: activeProject._id
        title: task.title
      $scope.taskModal.hide()
      task.title = ''
      return

    $scope.deleteTask = (task) ->
      $scope.Tasks.delete task
      return

    $scope.newTask = ->
      $scope.task = {}
      $scope.taskModal.show()
      return

    $scope.closeNewTask = ->
      $scope.taskModal.hide()
      return

    $scope.toggleProjects = ->
      $ionicSideMenuDelegate.toggleLeft()
      return

    $scope.pickDate = (task) ->
      options =
        date: new Date
        mode: 'date'
      #var options = {date: new Date(), mode: 'time'}; for time
      $cordovaDatePicker.show(options).then (date) ->
        task.date = date
        return
      return

    return
]
