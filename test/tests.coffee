chai   = require 'chai'
should = chai.should()
$      = require 'jquery'

X      = require '../lib'




describe 'jquery.val() cell', ->
  it 'should work with <input type="text">', ->
    $e = $('<input>').attr type: 'text'
    c = X $e

    $e.val().should.equal ''
    c().should.equal ''

    #  element ---> cell
    $e.val 'v1'
    
    # we need to test this in a propert browser
    # environment
    $e.trigger('change') 

    $e.val().should.equal 'v1'
    c().should.equal 'v1'

    #  element <--- cell
    c 'v2'
    c().should.equal 'v2'
    $e.val().should.equal 'v2'


  it 'should work with <input type="checkbox">', ->
    $e = $('<input>').attr type: 'checkbox'
    c = X $e

    $e.val().should.equal ''
    c().should.equal ''

    #  element ---> cell
    $e.val 'v1'
    
    # we need to test this in a propert browser
    # environment
    $e.trigger('change') 

    $e.val().should.equal 'v1'
    c().should.equal 'v1'

    #  element <--- cell
    c 'v2'
    c().should.equal 'v2'
    $e.val().should.equal 'v2'