function mkproject --description 'Create a new project directory'
  set -l project_name $argv[1]
  if test -z "$project_name"
      echo "Please provide a project name"
      return 1
  end
  
  mkdir -p $PROJECTS_DIR/$project_name
  cd $PROJECTS_DIR/$project_name
  git init
  echo "# $project_name" > README.md
  echo "Created new project: $project_name"
end