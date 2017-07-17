@extends('template')


@section('content')
<section class="col-lg-10 col-lg-offset-2 content" ng-app="employee" ng-controller="employeeCtrl" ng-cloak>
    <ol class="breadcrumb">
	  {!!$breadcrumb!!}
	</ol>
    @include('partials.alertmessage')
    <div ng-show="showForm">
        
        <!-- Create Form -->
        <div class="panel panel-default" ng-show="!form.id && !active_job">
            <div class="panel-heading">Create Employee
                <button class="btn btn-danger btn-xs pull-right" ng-click="cancelFrm()"><i class="glyphicon glyphicon-remove"></i></button>
            </div>
            <div class="panel-body">
            <form class="form-horizontal" ng-submit="saveEmployee()">
                <div class="form-group">
                    <label class="control-label col-lg-3">Employee ID</label>
                    <div class="col-lg-1">
                        <input type="text" class="form-control" name="employee_id" ng-model="form.employee_id"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">Name</label>
                    <div class="col-lg-3">
                        <input type="text" class="form-control" name="name" ng-model="form.name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">Present Address</label>
                    <div class="col-lg-6">
                        <textarea type="text" class="form-control" name="present_address" ng-model="form.present_address"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">Permanent Address</label>
                    <div class="col-lg-6">
                        <textarea type="text" class="form-control" name="permanent_address" ng-model="form.permanent_address"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">E-mail</label>
                    <div class="col-lg-3">
                        <input type="text" class="form-control" name="email" ng-model="form.email"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">Phone</label>
                    <div class="col-lg-3">
                        <input type="text" class="form-control" name="phone" ng-model="form.phone"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">Source</label>
                    <div class="col-lg-3">
                        <select name="source" class="form-control" ng-model="form.source">
                            <option ng-repeat="s in sources" value="@{{s}}">@{{s}}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">Source Name</label>
                    <div class="col-lg-3">
                        <input type="text" class="form-control" name="source_name" ng-model="form.source_name"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-3 col-lg-offset-3">
                        <input type="submit" class="btn btn-success btn-sm" value="Save"/>
                        <input ng-click="cancelFrm()" type="button" class="btn btn-warning btn-sm" value="Cancel"/>
                    </div>
                </div>
            </form>
            </div>
        </div>
        
        <!--- Update Form -->
        <div class="panel panel-default" ng-show="form.id && !active_job">
            
            
            <div class="panel-heading">
                Update Information - [@{{form.name}}]
                <button class="btn btn-danger btn-xs pull-right" ng-click="cancelFrm()"><i class="glyphicon glyphicon-remove"></i></button>
            </div>
            
            
            <div class="panel-body">
                
                <ul class="nav nav-tabs">
                    <li role="presentation" ng-class="{active:formTab.basic}"><a ng-click="selectFormTab('basic')">Basic Info</a></li>
                    <li role="presentation" ng-class="{active:formTab.edu}"><a ng-click="selectFormTab('edu')">Education</a></li>
                    <li role="presentation" ng-class="{active:formTab.work_exp}"><a ng-click="selectFormTab('work_exp')">Work Experience</a></li>
                    <li role="presentation" ng-class="{active:formTab.work_history}"><a ng-click="selectFormTab('work_history')">Work History</a></li>
                </ul>
                <form class="form-horizontal" ng-show="formTab.basic" ng-submit="saveEmployee()">
                <div class="col-lg-12" style="margin-top:20px">
                    <div class="form-group">
                        <label class="control-label col-lg-3">Employee ID</label>
                        <div class="col-lg-3">
                            <input type="text" class="form-control" name="employee_id" ng-model="form.employee_id"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3">Name</label>
                        <div class="col-lg-3">
                            <input type="text" class="form-control" name="name" ng-model="form.name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3">Present Address</label>
                        <div class="col-lg-6">
                            <textarea type="text" class="form-control" name="present_address" ng-model="form.present_address"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3">Permanent Address</label>
                        <div class="col-lg-6">
                            <textarea type="text" class="form-control" name="permanent_address" ng-model="form.permanent_address"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3">E-mail</label>
                        <div class="col-lg-3">
                            <input type="text" class="form-control" name="email" ng-model="form.email"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3">Phone</label>
                        <div class="col-lg-3">
                            <input type="text" class="form-control" name="phone" ng-model="form.phone"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3">Source</label>
                        <div class="col-lg-3">
                            <select name="source" class="form-control" ng-model="form.source">
                                <option ng-repeat="s in sources" value="@{{s}}">@{{s}}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3">Source Name</label>
                        <div class="col-lg-3">
                            <input type="text" class="form-control" name="source_name" ng-model="form.source_name"/>
                        </div>
                    </div>
                    <div class="form-group" ng-show="uploader.isHTML5">
                            <!-- 3. nv-file-over uploader="link" over-class="className" -->
                        <div class="col-lg-3 col-lg-offset-3">
                            <div class="well my-drop-zone" nv-file-drop="" nv-file-over="" uploader="uploader">
                                   Drag & Drop Photo
                            </div>
                            <input type="file" multiple="" uploader="uploader" nv-file-select="">
                        </div>
                        <div class="col-lg-3">
                            <div ng-show="form.photo && uploader.queue.length==0"><img alt="image"  height="100" ng-src="{{url('data/profile')}}/@{{form.photo}}"/></div>
                            <div ng-repeat="item in uploader.queue" ng-show="uploader.isHTML5">
                            <div ng-thumb="{ file: item._file, height: 100 }"></div>
                                <div style="margin-bottom: 0;" class="progress">
                                    <div ng-style="{ 'width': item.progress + '%' }" role="progressbar" class="progress-bar" style="width: 0%;"></div>
                                </div>
                                <a class="btn btn-warning btn-xs" ng-click="item.cancel()">Cancel</a>
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <input type="hidden" name="_token" value="{{csrf_token()}}"/>
                        <div class="col-lg-3 col-lg-offset-3">
                            <input type="submit" class="btn btn-success btn-sm" value="Save"/>
                        </div>
                    </div>
                </div>
            </form>
            <!-- Education -->
            <form class="form-horizontal" ng-show="formTab.edu" ng-submit="saveEducation()">
                
                <table class="table">
                    <thead>
                        <tr>
                            <th>Institute</th>
                            <th>Degree name</th>
                            <th>Passing Year</th>
                            <th>Grade</th>
                            <th><a class="btn btn-primary btn-xs" ng-click="rowEdu()"><i class="glyphicon glyphicon-plus"></i> Add Education</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="edu in edus">
                            <td><input type="text" class="form-control" ng-model="edu.institution_name" /></td>
                            <td><input type="text" class="form-control" ng-model="edu.degree_name" /></td>
                            <td><input type="text" class="form-control" ng-model="edu.pass_year" /></td>
                            <td><input type="text" class="form-control" ng-model="edu.grade" /></td>
                            <td><a ng-show="($index!=0)" ng-click="removeEduRow($index)" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></a></td>
                        </tr>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-success btn-sm">Update</button>
            </form>
            <!-- Work Experience -->
            <form class="form-horizontal" ng-show="formTab.work_exp" ng-submit="saveExperience()">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Work title</th>
                            <th>Organization Name</th>
                            <th>Year of Experience</th>
                            <th><a class="btn btn-primary btn-xs" ng-click="rowExp()"><i class="glyphicon glyphicon-plus"></i> Add Work Experience</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="exp in exps">
                            <td><input type="text" class="form-control" ng-model="exp.work_title" /></td>
                            <td><input type="text" class="form-control" ng-model="exp.org_name" /></td>
                            <td><input type="text" class="form-control" ng-model="exp.year_exp" /></td>
                            <td><a ng-show="($index!=0)" ng-click="removeExpRow($index)" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></a></td>
                        </tr>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-success btn-sm">Update</button>
            </form>
            <div class="form-horizontal" ng-show="formTab.work_history">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Department</th>
                            <th>Designation</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="history in work_history">
                            <td>@{{history.department.name}}</td>
                            <td>@{{history.designation.title}}</td>
                            <td>@{{history.job_start}}</td>
                            <td>@{{(history.active_job)? 'Continuing' : history.job_end}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        </div>
        <div class="panel panel-default" ng-if="form.id && active_job">
            <div class="panel-heading">
                Assign Job - to - [@{{form.name}}]
                <button class="btn btn-danger btn-xs pull-right" ng-click="cancelFrm()"><i class="glyphicon glyphicon-remove"></i></button>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" ng-submit="saveAssignJob()">
                    
                    <div class="form-group">
                        <label class="control-label col-lg-3">Department</label>
                        <div class="col-lg-3">
                            <select ng-model="job_details.department_id" ng-change="getDesignations()" class="form-control">
                                <option ng-repeat="department in departments" value="@{{department.id}}">@{{department.name}}</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-lg-3">Designation</label>
                        <div class="col-lg-3">
                            <select ng-model="job_details.designation_id" class="form-control">
                                <option ng-repeat="designation in designations" value="@{{designation.id}}">@{{designation.title}}</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-lg-3">Is Verifier?</label>
                        <div class="col-lg-1">
                            <input type="checkbox" class="form-control" ng-model="job_details.verifier"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-lg-3">Job Type</label>
                        <div class="col-lg-3">
                            <select class="form-control" ng-model="job_details.job_type" ng-change="getPaymentGroup()">
                                <option ng-repeat="j in job_type" value="@{{j}}">@{{j}}</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group" ng-show="groups">
                        <label class="control-label col-lg-3">Select Payment Group</label>
                        <div class="col-lg-3">
                            <div ng-repeat="g in groups">
                                <input type="radio" class="form-control" name="group" ng-model="job_details.payment_group" ng-value="g" ng-change="calculateBasicSalary(g)" style="display:inline;width:20px;vertical-align:middle;" /> <span style="vertical-align:middle;">@{{g.title}}</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3">Basic Salary</label>
                        <div class="col-lg-3">
                            <input type="text" ng-model="job_details.basic_salary" class="form-control"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-lg-3">Job Start</label>
                        <div class="col-lg-3">
                            <input type="text" name="job_start" ng-model="job_details.job_start" class="form-control" />
                            
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-lg-3">Leave Count</label>
                        <div class="col-lg-1">
                            <input type="text" ng-model="job_details.leave_count" class="form-control"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-lg-3">Job end</label>
                        <div class="col-lg-3">
                            <input type="text" ng-model="job_details.job_end" class="form-control" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-lg-3 col-lg-offset-3">
                            <input type="submit" class="btn btn-success btn-sm" value="Update" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">{{$page_title}}
        <button class="btn btn-primary btn-xs pull-right" ng-show="!showForm" ng-click="openFrm()"><i class="glyphicon glyphicon-plus"></i> New Employee</button>
        </div>
        <div class="panel-body">
            <ul class="nav nav-tabs push-right push-left">
                <li role="presentation" ng-class="{active:tab.avaiable_resource}"><a ng-click="selectTab('avaiable_resource')">Available Resources</a></li>
                <li role="presentation" ng-class="{active:tab.assigned_resource}"><a ng-click="selectTab('assigned_resource')">Assigned Resources</a></li>
            </ul>
            <div class="panel panel-default">
                
                        <div class="col-lg-3 push-down push-up">
                        <input type="text" placeholder="Search" class="form-control" ng-model="se" />
                        </div>
                
                <table class="table" ng-show="tab.avaiable_resource">
                    <thead>
                        <tr>
                            <th><a ng-click="toggleSort('name')">Name </a></th>
                            <th><a ng-click="toggleSort('email')">E-mail</a></th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="e in available_employees | filter:se | orderBy:sortorder">
                            <td>
                                <img width="50" ng-if="e.photo != null" ng-src="{{url('data/profile')}}/@{{e.photo}}"/>
                                <img width="50" ng-if="e.photo == null" ng-src="{{url('data/thumbnail/thumbnail.png')}}"/>
                                @{{e.name}}
                            </td>
                            <td>@{{e.email}}</td>
                            <td>
                                <a ng-click="viewEmployee(e)" class="btn btn-info btn-xs"><i class="glyphicon glyphicon-search"></i> View</a>
                                <a ng-click="assignResource(e)" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-plus"></i> Assign</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table class="table" ng-show="tab.assigned_resource">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>E-mail</th>
                            <th>Department</th>
                            <th>Designation</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="e in assigned_employees">
                            <td>
                                <img width="50" ng-if="e.photo != null" ng-src="{{url('data/profile')}}/@{{e.photo}}"/> 
                                <img width="50" ng-if="e.photo == null" ng-src="{{url('data/thumbnail/thumbnail.png')}}"/>     
                                @{{e.name}}
                            </td>
                            <td>@{{e.email}}</td>
                            <td>@{{e.active_job_details.department.name}}</td>
                            <td>@{{e.active_job_details.designation.title}}</td>
                            <td>
                                <a ng-click="viewEmployee(e)" class="btn btn-info btn-xs"><i class="glyphicon glyphicon-search"></i> View</a>
                                <a ng-click="releaseResource(e)" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i> Release</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
@stop