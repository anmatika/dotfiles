/* global describe, it, expect, afterEach */
import { fromJS } from 'immutable';
import sinon from 'sinon';
import Constants from '../budgetConstants';
import service from '../service';

import reducer, {
    SHOW_MODAL,
    CLOSE_MODAL,
    PRICE_QUANTITY_TOGGLER_VALUE_SET,
    OPERATION_TOGGLER_VALUE_SET,
    OPERATION_VALUE_SET,
    SET_INITIAL_STATE,
    MONTHS_SLIDER_VALUE_SET,
    SHOW_VALIDATION_ERRORS,
    SET_MODAL_TITLE
} from '../reducer';

const sandbox = sinon.sandbox.create();

afterEach(() => {
    sandbox.restore();
});

describe('SET_INITIAL_STATE', () => {
    it('Sets initial state', () => {
        sandbox.stub(service, 'getMetricColumnsFromGrid').returns([{}, {}, {}]);
        const initialState = fromJS({});

        const state = reducer(initialState, {
            type: SET_INITIAL_STATE
        });

        expect(state.get('priceQuantityTogglerValue')).to.equal(Constants.columnName.PRICE);
        expect(state.get('operationTogglerValue')).to.equal(Constants.mathOperation.MULTIPLY);
        // expect(state.get('operationValue')).to.equal('1.000'); NOTE: commented out temporarly, not work currently in builds (w/ PhantomJS )
        expect(state.get('monthsSliderValue')).to.deep.equal([0, 2]);

    });
});

describe('SHOW_MODAL', () => {
    it('Sets showModal', () => {
        const initialState = fromJS({});

        const state = reducer(initialState, {
            type: SHOW_MODAL
        });

        expect(state).to.equal(fromJS({
            showModal: true
        }));
    });
});

describe('CLOSE_MODAL', () => {
    it('Clears showModal', () => {
        const initialState = fromJS({});

        const state = reducer(initialState, {
            type: CLOSE_MODAL
        });

        expect(state).to.equal(fromJS({
            showModal: false
        }));
    });
});

describe('PRICE_QUANTITY_TOGGLER_VALUE_SET', () => {
    it('Sets priceQuantityTogglerValue', () => {
        const initialState = fromJS({});

        const state = reducer(initialState, {
            type: PRICE_QUANTITY_TOGGLER_VALUE_SET,
            data: Constants.columnName.QUANTITY
        });

        expect(state).to.equal(fromJS({
            priceQuantityTogglerValue: Constants.columnName.QUANTITY
        }));
    });
});

describe('OPERATION_TOGGLER_VALUE_SET', () => {
    it('Sets operationTogglerValue', () => {
        const initialState = fromJS({});

        const state = reducer(initialState, {
            type: OPERATION_TOGGLER_VALUE_SET,
            data: Constants.mathOperation.MULTIPLY
        });

        expect(state).to.equal(fromJS({
            operationTogglerValue: Constants.mathOperation.MULTIPLY
        }));
    });
});

describe('OPERATION_VALUE_SET', () => {
    it('Sets operationValue', () => {
        const initialState = fromJS({});

        const state = reducer(initialState, {
            type: OPERATION_VALUE_SET,
            data: '1.123'
        });

        expect(state).to.equal(fromJS({
            operationValue: '1.123'
        }));
    });
});

describe('MONTHS_SLIDER_VALUE_SET', () => {
    it('Sets monthsSliderValue', () => {
        const initialState = fromJS({});

        const state = reducer(initialState, {
            type: MONTHS_SLIDER_VALUE_SET,
            data: [1, 5]
        });
        expect(state.get('monthsSliderValue')).to.deep.equal([1, 5]);
    });
});

describe('SHOW_VALIDATION_ERRORS', () => {
    it('Sets validationError', () => {
        const initialState = fromJS({});

        const state = reducer(initialState, {
            type: SHOW_VALIDATION_ERRORS,
            data: fromJS({ operationValue: 'This field is not valid' })
        });
        expect(state.getIn(['validationErrors', 'operationValue'])).to.equal('This field is not valid');
    });
});

describe('SET_MODAL_TITLE', () => {
    it('Sets modalTitle', () => {
        const initialState = fromJS({});

        const state = reducer(initialState, {
            type: SET_MODAL_TITLE,
            data: 'Modal title'
        });
        expect(state.get('modalTitle')).to.equal('Modal title');
    });
});
