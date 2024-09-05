<?php

namespace App\Service;

use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Pharmacie;
use App\Entity\UserOrdrePharma;
use App\Entity\UserAdmin;
use App\Entity\Useradmingen;
use Symfony\Component\Security\Core\Exception\InvalidArgumentException;

class AuthenticationService
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    public function authenticate($username, $password)
    {
        // Cherche dans chaque entité
        $user = $this->findUser($username);

        if ($user && password_verify($password, $user->getPassword())) {
            return $user;
        }

        throw new InvalidArgumentException('Identifiant ou mot de passe incorrect.');
    }

    private function findUser($username)
    {
        $user = $this->entityManager->getRepository(Pharmacie::class)->findOneBy(['email' => $username]);

        if (!$user) {
            $user = $this->entityManager->getRepository(UserOrdrePharma::class)->findOneBy(['email' => $username]);
        }

        if (!$user) {
            $user = $this->entityManager->getRepository(Useradmingen::class)->findOneBy(['email' => $username]);
        }

        return $user;
    }
}
