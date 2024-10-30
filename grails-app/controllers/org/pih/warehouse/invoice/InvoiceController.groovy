/**
 * Copyright (c) 2012 Partners In Health.  All rights reserved.
 * The use and distribution terms for this software are covered by the
 * Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
 * which can be found in the file epl-v10.html at the root of this distribution.
 * By using this software in any fashion, you are agreeing to be bound by
 * the terms of this license.
 * You must not remove this notice, or any other, from this software.
 **/

package org.pih.warehouse.invoice

import org.pih.warehouse.core.Document
import org.pih.warehouse.core.Location
import org.pih.warehouse.order.Order
import org.pih.warehouse.order.OrderAdjustment
import org.pih.warehouse.order.OrderItem
import org.pih.warehouse.shipping.ShipmentItem

import java.text.SimpleDateFormat

class InvoiceController {
    def invoiceDataService
    def invoiceService

    // This template is generated by webpack during application start
    def index() {
        redirect(action: "create", params: params)
    }

    def create() {
        render(view: "/common/react", params: params)
    }

    def list() {
        render(view: "/common/react")
    }

    def show() {
        def invoiceInstance = Invoice.get(params.id)
        if (!invoiceInstance) {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'invoice.label', default: 'Invoice'), params.id])}"
            redirect(action: "list")
        } else {
            [invoiceInstance: invoiceInstance]
        }
    }

    def rollback() {
        def invoiceInstance = Invoice.get(params.id)
        if (!invoiceInstance) {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'invoice.label', default: 'Invoice'), params.id])}"
            redirect(action: "list")
        } else {
            invoiceInstance.datePosted = null
            if (params.refreshInvoice && invoiceInstance.isPrepaymentInvoice) {
                invoiceService.refreshInvoiceItems(invoiceInstance)
            }

            invoiceInstance.disableRefresh = invoiceInstance.isPrepaymentInvoice
            invoiceDataService.save(invoiceInstance)
            flash.message = "${g.message(code: 'invoices.successfulRollback.message')}"
            redirect(action: "show", id: params.id)
        }
    }

    def eraseInvoice() {
        def invoiceInstance = Invoice.get(params.id)
        if (invoiceInstance) {
            try {
                invoiceDataService.delete(invoiceInstance.id)
                flash.message = "${g.message(code: 'default.deleted.message', args: [g.message(code: 'invoice.label', default: 'Invoice'), params.id])}"
                redirect(action: "list")
                return
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${g.message(code: 'default.not.deleted.message', args: [g.message(code: 'invoice.label', default: 'Invoice'), params.id])}"
                redirect(action: "list", id: params.id)
                return
            }
        } else {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'invoice.label', default: 'Invoice'), params.id])}"
            redirect(action: "list")
            return
        }
        redirect(action: "list", id: params.id)
    }

    def generatePrepaymentInvoice() {
        Order order = Order.get(params.id)
        if (!order) {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'order.label', default: 'Order'), params.id])}"
            redirect(action: "list")
        }

        Invoice invoice = invoiceService.generatePrepaymentInvoice(order)
        redirect(action: "create", params: [id: invoice.id])
    }

    def generateInvoice() {
        Order order = Order.get(params.id)
        if (!order) {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'order.label', default: 'Order'), params.id])}"
            redirect(action: "list")
        }

        Invoice invoice = invoiceService.generateInvoice(order)
        redirect(action: "create", params: [id: invoice.id])
    }

    def addDocument() {
        def invoiceInstance = Invoice.get(params.id)
        if (!invoiceInstance) {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'invoice.label', default: 'Invoice'), params.id])}"
            redirect(action: "list")
        } else {
            return [invoiceInstance: invoiceInstance]
        }
    }

    def editDocument() {
        def invoiceInstance = Invoice.get(params?.invoice?.id)
        if (!invoiceInstance) {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'invoice.label', default: 'Invoice'), params.invoice.id])}"
            redirect(action: "list")
        } else {
            def documentInstance = Document.get(params?.id)
            if (!documentInstance) {
                flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'document.label', default: 'Document'), documentInstance.id])}"
                redirect(action: "show", id: invoiceInstance?.id)
            }
            render(view: "addDocument", model: [invoiceInstance: invoiceInstance, documentInstance: documentInstance])
        }
    }

    def deleteDocument() {
        def invoiceInstance = Invoice.get(params?.invoice?.id)
        if (!invoiceInstance) {
            flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'invoice.label', default: 'Invoice'), params.invoice.id])}"
            redirect(action: "list")
        } else {
            def documentInstance = Document.get(params?.id)
            if (!documentInstance) {
                flash.message = "${g.message(code: 'default.not.found.message', args: [g.message(code: 'comment.label', default: 'Document'), params.id])}"
                redirect(action: "show", id: invoiceInstance?.id)
            } else {
                invoiceInstance.removeFromDocuments(documentInstance)
                if (!invoiceInstance.hasErrors() && invoiceDataService.save(invoiceInstance)) {
                    flash.message = "${g.message(code: 'default.updated.message', args: [g.message(code: 'invoice.label', default: 'Invoice'), invoiceInstance.id])}"
                    redirect(action: "show", id: invoiceInstance.id)
                } else {
                    render(view: "show", model: [invoiceInstance: invoiceInstance])
                }
            }
        }
    }
}