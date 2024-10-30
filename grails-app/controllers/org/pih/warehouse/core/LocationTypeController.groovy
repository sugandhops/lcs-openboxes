/**
* Copyright (c) 2012 Partners In Health.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/
package org.pih.warehouse.core

class LocationTypeController {

    LocationTypeDataService locationTypeDataService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [locationTypeInstanceList: LocationType.list(params), locationTypeInstanceTotal: LocationType.count()]
    }

    def create() {
        def locationTypeInstance = new LocationType()
        locationTypeInstance.properties = params
        return [locationTypeInstance: locationTypeInstance]
    }

    def save() {
        LocationType locationTypeInstance = new LocationType(params)
        if (locationTypeDataService.save(locationTypeInstance)) {
            flash.message = "${g.message(code: 'default.created.message', args: [g.message(code: 'locationType.label', default: 'LocationType'), locationTypeInstance.id])}"
            redirect(action: "list", id: locationTypeInstance.id)
        }
        else {
            render(view: "create", model: [locationTypeInstance: locationTypeInstance])
        }
    }

    def show() {
        LocationType locationTypeInstance = locationTypeDataService.get(params.id)
        if (!locationTypeInstance) {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'locationType.label', default: 'LocationType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [locationTypeInstance: locationTypeInstance]
        }
    }

    def edit() {
        LocationType locationTypeInstance = locationTypeDataService.get(params.id)
        if (!locationTypeInstance) {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'locationType.label', default: 'LocationType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [locationTypeInstance: locationTypeInstance]
        }
    }

    def update() {
        LocationType locationTypeInstance = locationTypeDataService.get(params.id)
        if (locationTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (locationTypeInstance.version > version) {

                    locationTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [g.message(code: 'locationType.label', default: 'LocationType')] as Object[], "Another user has updated this LocationType while you were editing")
                    render(view: "edit", model: [locationTypeInstance: locationTypeInstance])
                    return
                }
            }
            locationTypeInstance.properties = params
            if (!locationTypeInstance.hasErrors() && locationTypeDataService.save(locationTypeInstance)) {
                flash.message = "${g.message(code: 'default.updated.message', args: [g.message(code: 'locationType.label', default: 'LocationType'), locationTypeInstance.id])}"
                redirect(action: "list", id: locationTypeInstance.id)
            }
            else {
                render(view: "edit", model: [locationTypeInstance: locationTypeInstance])
            }
        }
        else {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'locationType.label', default: 'LocationType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete() {
        LocationType locationTypeInstance = locationTypeDataService.get(params.id)
        if (locationTypeInstance) {
            try {
                locationTypeDataService.delete(locationTypeInstance.id)
                flash.message = "${g.message(code: 'default.deleted.message', args: [g.message(code: 'locationType.label', default: 'LocationType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${g.message(code: 'default.not.deleted.message', args: [g.message(code: 'locationType.label', default: 'LocationType'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'locationType.label', default: 'LocationType'), params.id])}"
            redirect(action: "list")
        }
    }
}