describe('Add to cart', () => {
  beforeEach(() => {
    cy.visit('localhost:3000');
  });

  it('Loads a product cart', () => {
    cy.get('a').contains('My Cart (0)');
  });

  it('Incriments product cart when add button is clicked', () => {
    cy.get('.products')
      .find('button')
      .contains('Add')
      .first()
      .click({ force: true });
    cy.get('a').contains('My Cart (1)');
  });



}

);