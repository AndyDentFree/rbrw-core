#tag Module
Protected Module RBUnit
	#tag Note, Name = BSD License
		* Copyright (c) 2007-2008, LogicalVue Software, Inc.
		* All rights reserved.
		*
		* Redistribution and use in source and binary forms, with or without
		* modification, are permitted provided that the following conditions are met:
		*     * Redistributions of source code must retain the above copyright
		*       notice, this list of conditions and the following disclaimer.
		*     * Redistributions in binary form must reproduce the above copyright
		*       notice, this list of conditions and the following disclaimer in the
		*       documentation and/or other materials provided with the distribution.
		*     * Neither the name of the <organization> nor the
		*       names of its contributors may be used to endorse or promote products
		*       derived from this software without specific prior written permission.
		*
		* THIS SOFTWARE (RBUNIT) IS PROVIDED BY LOGICALVUE SOFTWARE, INC. ``AS IS'' AND ANY
		* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
		* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
		* DISCLAIMED. IN NO EVENT SHALL LOGICALVUE SOFTWARE, INC. BE LIABLE FOR ANY
		* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
		* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
		* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
		* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
		* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
		* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	#tag EndNote

	#tag Note, Name = How To Register Tests
		There are two ways to run tests with RBUnit
		
		The first, and original, is to edit RBUnit.StartTests.StartTestFixtures
		
		The second is to create your own subclass of TestController and set it to be run with 
		RBUnitTestRunner.testSuite = new myTestController
		A good place to do that is in App.Open
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
